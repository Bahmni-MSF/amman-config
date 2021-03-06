DELETE FROM global_property WHERE property = 'emrapi.sqlSearch.otToBeScheduledQueue';
SELECT uuid() INTO @uuid;

INSERT INTO global_property (`property`, `property_value`, `description`, `uuid`)
VALUES ('emrapi.sqlSearch.otToBeScheduledQueue',
"SELECT
  pi.identifier                                                                                                                                        AS PATIENT_LISTING_QUEUES_HEADER_IDENTIFIER,
  concat(pn.given_name, ' ', pn.family_name)                                                                                                           AS PATIENT_LISTING_QUEUES_HEADER_NAME,
  procedureBlock.`procedure`                                                                                                                           AS `Planned Procedure`,
  finalValidationSurgeon.name                                                                                                                          AS `Surgeon Name`,
  speciality.name                                                                                                                                      AS Speciality,
  if(appointment_block.date_created IS NOT NULL AND procedureBlock.obs_datetime < appointment_block.date_created, appointment_block.status, NULL)      AS `Status`,
  appointment_block.notes																															   AS  `Reason for Change`,
  anaesthesiaOutcome.name                                                                                                                              AS `Outcome of Anaesthesia`
FROM patient p
  INNER JOIN patient_identifier pi ON pi.patient_id = p.patient_id
                                      AND pi.voided IS FALSE
                                      AND p.voided IS FALSE
  INNER JOIN person_name pn ON pn.person_id = p.patient_id AND pn.voided IS FALSE
  INNER JOIN patient_program pp ON pp.patient_id = p.patient_id AND pp.voided IS FALSE
  INNER JOIN patient_state ps ON ps.patient_program_id = pp.patient_program_id AND ps.end_date IS NULL AND ps.voided IS FALSE
  INNER JOIN program_workflow_state pws ON pws.program_workflow_state_id = ps.state AND pws.retired IS FALSE
  INNER JOIN concept_name state_cn ON state_cn.concept_id = pws.concept_id AND state_cn.concept_name_type = 'FULLY_SPECIFIED' AND state_cn.voided IS FALSE
  INNER JOIN (
  SELECT
  p.person_id,
  planned_procedures.all_procedures AS `procedure`,
  latest_form.date_created,
  latest_form.obs_datetime
FROM
  person p
  INNER JOIN (
               SELECT
                 form_obs.obs_id,
                 form_obs.person_id,
                 form_obs.date_created,
                 form_obs.obs_datetime
               FROM
                 (SELECT
                    MAX(o.obs_datetime) AS max_obs_datetime,
                    o.person_id
                  FROM obs o
                    INNER JOIN concept_name cn
                      ON cn.concept_id = o.concept_id
                         AND cn.name IN ('Surgeon Pre-Op Assessment and Treatment Plan', 'Surgeon Follow-up')
                         AND cn.concept_name_type = 'FULLY_SPECIFIED' AND cn.voided IS FALSE AND
                         o.voided IS FALSE
                  GROUP BY o.person_id
                 ) latest_form_obs
                 INNER JOIN obs form_obs
                   ON form_obs.obs_datetime = latest_form_obs.max_obs_datetime
                      AND form_obs.person_id = latest_form_obs.person_id
                      AND form_obs.voided IS FALSE
                 INNER JOIN concept_name form_cn
                   ON form_cn.concept_id = form_obs.concept_id
                      AND form_cn.name IN ('Surgeon Pre-Op Assessment and Treatment Plan', 'Surgeon Follow-up')
                      AND form_cn.concept_name_type = 'FULLY_SPECIFIED' AND form_cn.voided IS FALSE
             ) latest_form ON latest_form.person_id = p.person_id
  INNER JOIN (

               SELECT consent_obs.obs_group_id
               FROM obs consent_obs
                 INNER JOIN concept_name consent_cn
                   ON consent_cn.concept_id = consent_obs.concept_id
                      AND consent_cn.name IN
                          ('SAP, Is patient for surgery', 'SFP, Is patient for surgery')
                      AND consent_cn.concept_name_type = 'FULLY_SPECIFIED' AND consent_cn.voided IS FALSE
                      AND consent_obs.voided IS FALSE
                 INNER JOIN concept_name consent_answer_cn
                   ON consent_answer_cn.concept_id = consent_obs.value_coded
                      AND consent_answer_cn.name = 'Yes'
                      AND consent_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                      consent_answer_cn.voided IS FALSE
             ) consent_on_form ON consent_on_form.obs_group_id = latest_form.obs_id
  LEFT OUTER JOIN (
                    SELECT
                      GROUP_CONCAT(planned_procedure SEPARATOR ' + ') AS all_procedures,
                      planned_procedure_group_id
                    FROM
                      (SELECT
                         CONCAT_WS(' on ', CONCAT_WS(' , ', procedures, procedures_non_coded), NULLIF(CONCAT_WS(' ', side, site), ' '))
                                                                              AS planned_procedure,
                         planned_surgical_procedures_on_form.planned_procedure__obs_group_id AS planned_procedure_group_id
                       FROM

                         (SELECT
                            planned_surgical_procedures_for_next_ot_section.obs_id                                 AS planned_procedure__obs_id,
                            planned_surgical_procedures_for_next_ot_section.obs_group_id                           AS planned_procedure__obs_group_id,
                            GROUP_CONCAT(DISTINCT proc_coded_answer_cn.name SEPARATOR
                                         ', ')                                                                     AS procedures,
                            GROUP_CONCAT(DISTINCT planned_proc_answer.value_text SEPARATOR
                                         ', ')                                                                     AS procedures_non_coded,
                            GROUP_CONCAT(DISTINCT COALESCE(site_coded_answer_cn.concept_short_name,
                                                           site_coded_answer_cn.concept_full_name) SEPARATOR
                                         ', ')                                                                     AS site,
                            GROUP_CONCAT(DISTINCT
                                         side_coded_answer_cn.name)                                                AS side
                          FROM obs
                               planned_surgical_procedures_for_next_ot_section
                            INNER JOIN concept_name planned_sp_cn
                              ON planned_sp_cn.concept_id = planned_surgical_procedures_for_next_ot_section.concept_id
                                 AND planned_sp_cn.name IN
                                     ('SAP, Planned Surgical Procedures for next OT', 'FP, Planned Surgical Procedures for next OT')
                                 AND planned_sp_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 planned_sp_cn.voided IS FALSE
                                 AND planned_surgical_procedures_for_next_ot_section.voided IS FALSE
                            INNER JOIN concept_name planned_proc_cn
                              ON planned_proc_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND planned_proc_cn.voided IS FALSE
                                 AND planned_proc_cn.name IN
                                     ('SAP, Planned procedure data', 'FP, Planned Procedure (surgical) data')
                            INNER JOIN concept_name site_of_surgical_procedure_cn
                              ON site_of_surgical_procedure_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND site_of_surgical_procedure_cn.voided IS FALSE
                                 AND site_of_surgical_procedure_cn.name IN
                                     ('SAP, Site of surgical procedure', 'SFP, Site of surgical procedure')
                            INNER JOIN concept_name side_of_surgical_procedure_cn
                              ON side_of_surgical_procedure_cn.concept_name_type = 'FULLY_SPECIFIED'
                                 AND side_of_surgical_procedure_cn.voided IS FALSE
                                 AND side_of_surgical_procedure_cn.name IN
                                     ('SAP, Side of surgical procedure', 'SFP, Side of surgical procedure')
                            LEFT OUTER JOIN obs planned_procedure
                              ON planned_procedure.obs_group_id = planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND planned_procedure.concept_id = planned_proc_cn.concept_id
                                 AND planned_procedure.voided IS FALSE
                            LEFT OUTER JOIN obs planned_proc_answer
                              ON planned_proc_answer.obs_group_id = planned_procedure.obs_id
                                 AND planned_proc_answer.voided IS FALSE
                            LEFT OUTER JOIN concept_name proc_coded_answer_cn
                              ON proc_coded_answer_cn.concept_id = planned_proc_answer.value_coded
                                 AND proc_coded_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 proc_coded_answer_cn.voided IS FALSE
                            LEFT OUTER JOIN obs site_of_surgical_procedure
                              ON site_of_surgical_procedure.obs_group_id =
                                 planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND site_of_surgical_procedure.concept_id = site_of_surgical_procedure_cn.concept_id
                                 AND site_of_surgical_procedure.voided IS FALSE
                            LEFT OUTER JOIN concept_view site_coded_answer_cn
                              ON site_coded_answer_cn.concept_id = site_of_surgical_procedure.value_coded
                                 AND site_coded_answer_cn.retired IS FALSE
                            LEFT OUTER JOIN obs side_of_surgical_procedure
                              ON side_of_surgical_procedure.obs_group_id =
                                 planned_surgical_procedures_for_next_ot_section.obs_id
                                 AND side_of_surgical_procedure.concept_id = side_of_surgical_procedure_cn.concept_id
                                 AND side_of_surgical_procedure.voided IS FALSE
                            LEFT OUTER JOIN concept_name side_coded_answer_cn
                              ON side_coded_answer_cn.concept_id = side_of_surgical_procedure.value_coded
                                 AND side_coded_answer_cn.concept_name_type = 'FULLY_SPECIFIED' AND
                                 side_coded_answer_cn.voided IS FALSE
                          GROUP BY planned_surgical_procedures_for_next_ot_section.obs_id
                         ) planned_surgical_procedures_on_form
                       GROUP BY planned_surgical_procedures_on_form.planned_procedure__obs_id
                      ) planned_surgical_procedures_on_form
                    GROUP BY planned_surgical_procedures_on_form.planned_procedure_group_id
                  ) planned_procedures ON planned_procedures.planned_procedure_group_id = latest_form.obs_id
             ) procedureBlock ON procedureBlock.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                AND o.voided IS FALSE
                                                AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                    AND cn.voided IS FALSE
                                                    AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND cn.name = 'FSTG, Specialty determined by MLO'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                AND coded_scn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     o.person_id,
                                     MAX(e.encounter_datetime) AS encounter_datetime
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                   AND cn.name = 'FSTG, Specialty determined by MLO'
                                                                   AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND cn.voided IS FALSE
                                                                   AND o.voided IS FALSE
                                     INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                               AND e.voided IS FALSE
                                   GROUP BY person_id
                                 ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                       AND latest_encounter.person_id = o.person_id
                    GROUP BY o.person_id
                  ) speciality ON speciality.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                AND o.voided IS FALSE
                                                AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                    AND cn.voided IS FALSE
                                                    AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND cn.name = 'AIA, Outcome of anaesthesia initial assessment'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                AND coded_scn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     o.person_id,
                                     MAX(e.encounter_datetime) AS encounter_datetime
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                   AND cn.name =
                                                                       'AIA, Outcome of anaesthesia initial assessment'
                                                                   AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND cn.voided IS FALSE
                                                                   AND o.voided IS FALSE
                                     INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                               AND e.voided IS FALSE
                                   GROUP BY person_id
                                 ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                       AND latest_encounter.person_id = o.person_id
                    GROUP BY o.person_id
                  ) anaesthesiaOutcome ON anaesthesiaOutcome.person_id = p.patient_id
  LEFT OUTER JOIN (
                    SELECT
                      o.person_id,
                      GROUP_CONCAT(DISTINCT (COALESCE(coded_fscn.name, coded_scn.name))) AS 'name'
                    FROM
                      obs o
                      INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                AND o.voided IS FALSE
                                                AND e.voided IS FALSE
                      INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                    AND cn.voided IS FALSE
                                                    AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                    AND cn.name = 'FV, Name (s) of Surgeon 1'
                      LEFT OUTER JOIN concept_name coded_fscn ON coded_fscn.concept_id = o.value_coded
                                                                 AND coded_fscn.concept_name_type = 'FULLY_SPECIFIED'
                                                                 AND coded_fscn.voided IS FALSE
                      LEFT OUTER JOIN concept_name coded_scn ON coded_scn.concept_id = o.value_coded
                                                                AND coded_scn.concept_name_type = 'SHORT'
                                                                AND coded_scn.voided IS FALSE
                      INNER JOIN (
                                   SELECT
                                     o.person_id,
                                     MAX(e.encounter_datetime) AS encounter_datetime
                                   FROM
                                     obs o
                                     INNER JOIN concept_name cn ON cn.concept_id = o.concept_id
                                                                   AND cn.name = 'FV, Name (s) of Surgeon 1'
                                                                   AND cn.concept_name_type = 'FULLY_SPECIFIED'
                                                                   AND cn.voided IS FALSE
                                                                   AND o.voided IS FALSE
                                     INNER JOIN encounter e ON e.encounter_id = o.encounter_id
                                                               AND e.voided IS FALSE
                                   GROUP BY person_id
                                 ) latest_encounter ON latest_encounter.encounter_datetime = e.encounter_datetime
                                                       AND latest_encounter.person_id = o.person_id
                    GROUP BY o.person_id
                  ) finalValidationSurgeon ON finalValidationSurgeon.person_id = p.patient_id
  LEFT OUTER JOIN
  (
    SELECT
      p.patient_id,
      appoinment.date_created,
      appoinment.status,
      appoinment.notes
    FROM patient p
      LEFT OUTER JOIN (
                        SELECT
                          sa.patient_id,
                          sa.date_created,
                          sa.status,
                          sa.notes
                        FROM
                          surgical_appointment sa
                          INNER JOIN (SELECT
                                        sa.patient_id        AS patient_id,
                                        MAX(sa.date_created) AS date_created
                                      FROM surgical_appointment sa
                                      WHERE sa.voided IS FALSE
                                      GROUP BY sa.patient_id
                                     ) latest_appointment ON latest_appointment.patient_id = sa.patient_id
                                                             AND latest_appointment.date_created = sa.date_created
                                                             AND sa.voided IS FALSE) appoinment
        ON appoinment.patient_id = p.patient_id AND p.voided IS FALSE
  ) appointment_block ON appointment_block.patient_id = p.patient_id
WHERE
  state_cn.name NOT IN ('Network Follow-up')
  AND
  pp.date_completed IS NULL
  AND
  (procedureBlock.obs_datetime > appointment_block.date_created
  OR
  appointment_block.status = 'POSTPONED' AND procedureBlock.obs_datetime < appointment_block.date_created
  OR
  appointment_block.date_created IS NULL AND procedureBlock.obs_datetime IS NOT NULL)
ORDER BY procedureBlock.obs_datetime DESC;"
   ,'SQL for to be scheduled patient listing queues for OT module',@uuid);