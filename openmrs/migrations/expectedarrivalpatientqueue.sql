 DELETE FROM global_property where property = 'emrapi.sqlSearch.expectedArrival';
 select uuid() into @uuid;


 INSERT INTO global_property (property, property_value, description, uuid)
 VALUES ('emrapi.sqlSearch.expectedArrival',
"SELECT
  personData.identifier,
  personData.name AS PATIENT_LISTING_QUEUES_HEADER_NAME,
  personData.age  AS 'Age',
  paddress.address3  AS  'Country',
  specialty.Specialty,
  priority.Priority,
  comments.`Comments about Validation`,
  latest_obs.`Name of Surgeon 1`,
  latest_obs.`Name of Surgeon 2`,
  personData.expected_date_of_arrival AS 'Expected Date of Arrival',
  latest_obs.`Patient General Condition`,
  latest_obs.`Does the patient need accomodation`,
  latest_obs.`Type of Admission Recommended`,
  careTakerRequired.isCareTakerRequired AS 'Is Caretaker Required?',
  careTakerGender.`Caretaker Gender`,
  careTakerName.`Caretaker Name`,
  'Admit'                                             AS `bed management`,
  'Enter Disposition'                                 AS disposition,
  personData.uuid,
  personData.programUuid,
  personData.enrollment
FROM  (SELECT
        p.uuid                                                                                                     AS uuid,
        prog.uuid                                                                                                  AS programUuid,
        pp.uuid                                                                                                    AS enrollment,
        pp.date_enrolled,
         DATE_FORMAT(expected_date_of_arrival.value, '%d/%m/%Y')                                                   AS expected_date_of_arrival,
        concat(pn.given_name, ' ', pn.family_name)                                                                 AS name,
        floor(DATEDIFF(CURDATE(), p.birthdate) / 365)                                                              AS age,
        pi.identifier                                                                                              AS identifier,
        p.person_id                                                                                                AS person_id,
        expected_date_of_arrival.value AS expected_date
      FROM person p
        JOIN patient_identifier pi ON p.person_id = pi.patient_id AND p.voided IS FALSE AND pi.voided IS FALSE
        JOIN patient_program pp ON pp.patient_id = p.person_id AND pp.voided IS FALSE
        JOIN program prog ON prog.program_id = pp.program_id  AND prog.retired IS FALSE
        JOIN person_name pn ON p.person_id = pn.person_id AND pn.voided IS FALSE
        JOIN person_attribute_type expected_pat ON expected_pat.retired IS FALSE AND
                                                   expected_pat.name = 'expectedDateofArrival'
        JOIN person_attribute expected_date_of_arrival ON expected_date_of_arrival.person_id = p.person_id AND
                                                          expected_date_of_arrival.person_attribute_type_id = expected_pat.person_attribute_type_id AND expected_date_of_arrival.voided IS FALSE
        GROUP BY p.person_id) personData
  LEFT JOIN person_address paddress ON personData.person_id = paddress.person_id AND paddress.voided IS FALSE
  LEFT JOIN (SELECT
               if(pa.value = 'true', 'Yes', NULL) AS isCareTakerRequired,
               pa.person_id
             FROM person_attribute pa
               JOIN person_attribute_type pat
                 ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND
                    pat.name = 'isCareTakerRequired' AND pa.voided IS FALSE
             GROUP BY pa.person_id
            ) careTakerRequired ON careTakerRequired.person_id = personData.person_id
  LEFT JOIN (SELECT
               pa.value AS 'Caretaker Name',
               pa.person_id
             FROM person_attribute pa
               JOIN person_attribute_type pat
                 ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND
                    pat.name = 'caretakerNameEnglish' AND pa.voided IS FALSE
             GROUP BY pa.person_id
            ) careTakerName ON careTakerName.person_id = personData.person_id

  LEFT JOIN (SELECT
               coalesce(cv.concept_short_name, cv.concept_full_name) AS 'Caretaker Gender',
               pa.person_id
             FROM person_attribute pa
               JOIN person_attribute_type pat
                 ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired IS FALSE AND
                    pat.name = 'caretakerGender' AND pa.voided IS FALSE
                JOIN concept_view cv ON cv.concept_id = pa.value
             GROUP BY pa.person_id
            ) careTakerGender ON careTakerGender.person_id = personData.person_id
  LEFT JOIN (
              SELECT
                obs.person_id,
                GROUP_CONCAT(DISTINCT (IF(c_name = 'MH, Patient General Condition',
                                          COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Patient General Condition',
                GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Does the Patient need Accommodation?',
                                          COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Does the patient need accomodation',
                GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Type of Admission Recommended',
                                          COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Type of Admission Recommended',
                GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 1',
                                          COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of Surgeon 1',
                GROUP_CONCAT(DISTINCT (IF(c_name = 'FV, Name (s) of Surgeon 2',
                                          COALESCE(coded_fscn.name, coded_scn.name), NULL))) AS 'Name of Surgeon 2'
              FROM (SELECT
                      cn.name             AS c_name,
                      o.person_id,
                      max(o.obs_datetime) AS max_obs_datetime,
                      o.concept_id
                    FROM obs o
                      JOIN concept_name cn ON cn.name IN
                                              ('MH, Patient General Condition',
                                               'FV, Does the Patient need Accommodation?',
                                               'FV, Type of Admission Recommended',
                                               'FV, Name (s) of Surgeon 1',
                                               'FV, Name (s) of Surgeon 2')
                                              AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                              o.voided IS FALSE
                    GROUP BY person_id, concept_id) result
                JOIN obs ON obs.concept_id = result.concept_id AND obs.obs_datetime = result.max_obs_datetime AND
                            obs.voided IS FALSE
                LEFT JOIN concept_name coded_fscn ON coded_fscn.concept_id = obs.value_coded
                                                     AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                     AND coded_fscn.voided IS FALSE
                LEFT JOIN concept_name coded_scn ON coded_scn.concept_id = obs.value_coded
                                                    AND coded_fscn.concept_name_type = 'SHORT'
                                                    AND coded_scn.voided IS FALSE
              GROUP BY obs.person_id
            ) latest_obs ON personData.person_id = latest_obs.person_id
  LEFT JOIN (
              SELECT
                GROUP_CONCAT(COALESCE(cv.concept_short_name, cv.concept_full_name)) AS 'Specialty',
                obs.person_id
              FROM (SELECT
                      cn.name             AS c_name,
                      o.person_id,
                      max(o.obs_id) AS latest_obs_id,
                      o.concept_id
                    FROM obs o
                      JOIN concept_name cn ON cn.name IN
                                              ('FSTG, Medical Files')
                                              AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                              o.voided IS FALSE
                    GROUP BY person_id) latest_medical_files
                JOIN obs ON obs.obs_group_id = latest_medical_files.latest_obs_id AND obs.voided IS FALSE
                JOIN concept_name cn ON cn.concept_id = obs.concept_id AND cn.name= 'FSTG, Specialty determined by MLO' AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE
                JOIN concept_view cv ON cv.concept_id = obs.value_coded
              GROUP BY obs.person_id
            ) specialty ON personData.person_id = specialty.person_id
  LEFT JOIN (
              SELECT
                coalesce(priority_answer.concept_short_name, priority_answer.concept_full_name) AS 'Priority',
                priority_obs.person_id
              FROM (
                     SELECT
                       MAX(obs_datetime) AS obs_datetime,
                       o.person_id
                     FROM obs o
                       JOIN concept_name cn ON cn.name IN ('FSTG, Priority', 'FUP, Priority')
                                               AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND
                                               o.voided IS FALSE
                     GROUP BY o.person_id
                   ) latest_priority_obs
                JOIN obs priority_obs ON priority_obs.person_id = latest_priority_obs.person_id AND
                                         priority_obs.obs_datetime = latest_priority_obs.obs_datetime AND
                                         priority_obs.voided IS FALSE
                JOIN concept_view cv ON cv.concept_id = priority_obs.concept_id AND
                                        cv.concept_full_name IN ('FSTG, Priority', 'FUP, Priority') AND
                                        cv.retired IS FALSE
                JOIN concept_view priority_answer
                  ON priority_obs.value_coded = priority_answer.concept_id AND priority_answer.retired IS FALSE
            ) priority ON priority.person_id = personData.person_id

  LEFT JOIN (
              SELECT
                comments_obs.value_text AS 'Comments about Validation',
                comments_obs.person_id
              FROM (
                     SELECT
                       MAX(obs_datetime) AS obs_datetime,
                       o.person_id
                     FROM obs o
                       JOIN concept_name cn
                         ON cn.name IN ('FSTG, Comments', 'FUP, Comments about further stage admission')
                            AND cn.concept_id = o.concept_id AND cn.voided IS FALSE AND o.voided IS FALSE
                     GROUP BY o.person_id
                   ) latest_comments_obs
                JOIN obs comments_obs ON comments_obs.person_id = latest_comments_obs.person_id AND
                                         comments_obs.obs_datetime = latest_comments_obs.obs_datetime AND
                                         comments_obs.voided IS FALSE
                JOIN concept_view cv ON cv.concept_id = comments_obs.concept_id AND cv.concept_full_name IN
                                                                                    ('FSTG, Comments', 'FUP, Comments about further stage admission')
                                        AND cv.retired IS FALSE
            ) comments ON comments.person_id = personData.person_id

ORDER BY personData.expected_date", 'Expected Arrival Patient Queue', @uuid);