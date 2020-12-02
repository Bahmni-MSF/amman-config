set @concept_id = 0;
set @concept_short_id = 0;
set @concept_full_id = 0;
set @count = 0;
set @uuid = NULL;

-- question concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Date Recorded","Date Recorded","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Type of Assessment","Type of Assessment","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Case","COVID-19 Case","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Date of PCR Test","Date of PCR Test","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Type of Specimen COVID-19","Type of Specimen","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Specimen Type","Other Specimen Type","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, PCR Test Results","PCR Test Results","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other COVID-19 Test Done","Other COVID-19 Test Done","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Date of Other COVID-19 Test","Date of Other COVID-19 Test","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Mode of Arrival","Mode of Arrival","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Referral From","Referral From","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Mode of Arrival","Other Mode of Arrival","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Contact with a Confirmed COVID-19 Case in Last 14 Days?","Contact with a Confirmed COVID-19 Case in Last 14 Days?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Has Patient Traveled in the Past 14 Days?","Has Patient Traveled in the Past 14 Days?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Traveled to Which Country","Traveled to Which Country","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Date of Return from Travel","Date of Return from Travel","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Has Patient Been in a Healthcare Facility in the Last 14 Days?","Has Patient Been in a Healthcare Facility in the Last 14 Days?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Name of the Healthcare Facility","Name of the Healthcare Facility","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, In or Outpatient Care in the Healthcare Facility?","In or Outpatient Care in the Healthcare Facility?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Is Patient a Healthcare Worker?","Is Patient a Healthcare Worker?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Weight","Weight","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Height","Height","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Temp","Temp","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, RR","RR","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, SpO2 on room air","SpO2 on room air","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, SpO2 on Oxygen","SpO2 on Oxygen","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, How Many Liters of Oxygen Per Min?","How Many Liters of Oxygen Per Min?","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Heart Rate","Heart Rate","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Systolic BP","Systolic BP","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Diastolic BP","Diastolic BP","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Pain","Pain","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Signs and Symptoms at Admission","Signs and Symptoms at Admission","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Signs and Symptoms","Other Signs and Symptoms","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Days Since Onset of First Symptoms","Days Since Onset of First Symptoms","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, History of Present Illness","History of Present Illness","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Is the Patient a Woman of Reproductive Age Group (15 - 51)?","Is the Patient a Woman of Reproductive Age Group (15 - 51)?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Pregnant","Pregnant","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Gestational Age","Gestational Age","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Breastfeeding","Breastfeeding","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Post-Partum (less than 6 Weeks)","Post-Partum (<6 Weeks)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Current/Recent COVID-19 Medications (Past 14 Days)","Current/Recent COVID-19 Medications (Past 14 Days)","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Current/Recent Medications","Other Current/Recent Medications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Medication Allergies","Medication Allergies","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Smoking History","Smoking History","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Co-Morbidities","Co-Morbidities","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Co-Morbidities","Other Co-Morbidities","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Past Complimentary Medical History","Past Complimentary Medical History","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Level of Consciousness","Level of Consciousness","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Cardiac","Cardiac","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Respiratory","Respiratory","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Abdomen","Abdomen","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Skin","Skin","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Neuro/Other Systems","Neuro/Other Systems","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Physical Examination Findings","Other Physical Examination Findings","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Severity","COVID-19 Severity","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, HB","HB","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Glucose","Glucose","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Pregnancy Test","Pregnancy Test","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Biochem/Blood Gases","Biochem/Blood Gases","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Tests If Indicated","Other Tests If Indicated","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Radiology Findings","Radiology Findings","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, ECG","ECG","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Disposition","Disposition","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Exit Date and Time","Exit Date and Time","Datetime","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Admission Date and Time","Admission Date and Time","Datetime","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Admitted to","Admitted to","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Referral to","Referral to","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Discharged Home","Discharged Home","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Complications","Complications","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Complications","Other Complications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, ICU Complications","ICU Complications","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other ICU Complications","Other ICU Complications","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Persistent Symptoms at Discharge","COVID-19 Persistent Symptoms at Discharge","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Symptoms at Discharge","Other Symptoms at Discharge","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Newly Introduced Treatment During Hospitalization","Newly Introduced Treatment During Hospitalization","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Antibiotics","Antibiotics","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Corticosteroid","Corticosteroid","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Newly Introduced Treatment During Hospitalization","Other Newly Introduced Treatment During Hospitalization","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Treatment Adverse Events","Treatment Adverse Events","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, ICU During Hospitalization?","ICU During Hospitalization?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, ICU Respiratory Support","ICU Respiratory Support","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Number of Days Under Invasive Mechanical Ventilation","Number of Days Under Invasive Mechanical Ventilation","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Number of Days Under Non Invasive Mechanical Ventilation","Number of Days Under Non Invasive Mechanical Ventilation","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Number of Days in ICU","Number of Days in ICU","Numeric","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Procedures During ICU Stay","Procedures During ICU Stay","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Procedures During ICU Stay","Other Procedures During ICU Stay","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, If Pregnant","If Pregnant","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Date of COVID-19 Test","Date of COVID-19 Test","Date","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Type of COVID-19 Test","Type of COVID-19 Test","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Type of Specimen","Type of Specimen","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Test Results","COVID-19 Test Results","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Discharge Treatment Plan","Discharge Treatment Plan","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Newly Introduced Treatment to Be Continued at Home","Newly Introduced Treatment to Be Continued at Home","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Treatment of Pre-Existing/Chronic Conditions to Be Continued","Treatment of Pre-Existing/Chronic Conditions to Be Continued","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Clinical Follow-Up Requirements","Clinical Follow-Up Requirements","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Hospital Discharge Status","Hospital Discharge Status","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Referral to Another Hospital","Referral to Another Hospital","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Death","Death","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Was the Death in the ICU?","Was the Death in the ICU?","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, ICU Death","ICU Death","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Cause of Death","Cause of Death","Coded","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Other Cause of Death","Other Cause of Death","Text","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Discharge Date and Time","Discharge Date and Time","Datetime","Misc",false);


-- adding answer concepts

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Greater than equal to 1 and less than 24 Hours","≥1 To <24 Hours","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Greater than equal to 24 Hours","≥24 Hours","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ACE-I/ARB","ACE-I/ARB","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Acute Respiratory Distress Syndrome","Acute Respiratory Distress Syndrome","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Admitted to Hospital","Admitted to Hospital","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Alert","Alert","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Asymptomatic","Asymptomatic","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Bed Sore","Bed Sore","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Bed Sores Prone Related","Bed Sores Prone Related","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"BiPAP","BiPAP","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Blood","Blood","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Cardiovascular Disease","Cardiovascular Disease","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Central Line Infection","Central Line Infection","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Central Line Insertion","Central Line Insertion","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Chronic Lung Disease","Chronic Lung Disease","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Corticosteroid","Corticosteroid","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Corticosteroids","Corticosteroids","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"COVID-19 Ward","COVID-19 Ward","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CPAP","CPAP","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Current smoker","Current smoker","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Death less than 24 Hours Admission","Death <24 Hours Admission","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Death greater than 24 Hours Admission","Death >24 Hours Admission","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Deep Vein Thrombosis/PE","Deep Vein Thrombosis/PE","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Died","Died","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Difficulty Breathing","Difficulty Breathing","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharge Home","Discharge Home","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharged Home for Self-Isolation","Discharged Home for Self-Isolation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Discharged With Pregnancy Intact","Discharged With Pregnancy Intact","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Enteral Nutrition","Enteral Nutrition","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Former Smoker","Former Smoker","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Healthcare Worker at Non-MSF Facility","Healthcare Worker at Non-MSF Facility","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Hematological Disease","Hematological Disease","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ICU With Intubation at Admission","ICU With Intubation at Admission","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"ICU Without Intubation at Admission","ICU Without Intubation at Admission","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"In-Patient Admission","In-Patient Admission","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Intubated Prone Position","Intubated Prone Position","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Invalid","Invalid","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Invasive Mechanical Ventilation","Invasive Mechanical Ventilation","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"IPC/Hygiene Advice Provide","IPC/Hygiene Advice Provide","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Liver Failure","Liver Failure","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Loss of Smell","Loss of Smell","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Loss of Taste","Loss of Taste","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Malignancy","Malignancy","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Mental Health Disorder","Mental Health Disorder","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Minor","Minor","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Miscarriage","Miscarriage","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Multi Organ Failure","Multi Organ Failure","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Muscle Aches","Muscle Aches","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Myocarditis","Myocarditis","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Nasal Sore NIV Related","Nasal Sore NIV Related","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Nausea/Vomiting","Nausea/Vomiting","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Neurological Disease","Neurological Disease","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"No Pain","No Pain","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Non Intubated Prone Position","Non Intubated Prone Position","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Non-Smoker","Non-Smoker","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Not a Case","Not a Case","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"NSAID","NSAID","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Obesity","Obesity","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Oropharyngeal","Oropharyngeal","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Other Immune Suppression","Other Immune Suppression","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Other Ward","Other Ward","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Out-Patient Follow-Up by MSF","Out-Patient Follow-Up by MSF","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Outpatient","Outpatient","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Blood Transfusion","Blood Transfusion","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Parenteral Nutrition","Parenteral Nutrition","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Pending","Pending","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Peripheral IV Site Infection","Peripheral IV Site Infection","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Probable","Probable","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Rapid Test","Rapid Test","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Referral","Referral","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Referral to Another Hospital","Referral to Another Hospital","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Referred to Other Facility","Referred to Other Facility","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Remdesivir","Remdesivir","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Renal Disease","Renal Disease","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Renal Failure","Renal Failure","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Respiratory Failure","Respiratory Failure","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Self","Self","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Severe","Severe","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Signs of Deterioration Explained","Signs of Deterioration Explained","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Suggestive Chest X-Ray","Suggestive Chest X-Ray","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Suggestive CT Scan","Suggestive CT Scan","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Superimposed Bacterial Pneumonia","Superimposed Bacterial Pneumonia","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Suspect","Suspect","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Thoracostomy Tube","Thoracostomy Tube","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Unresponsive","Unresponsive","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Urinary Catheter Infection","Urinary Catheter Infection","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Vasopressor Infusion","Vasopressor Infusion","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Ventilator Associated Pneumonia","Ventilator Associated Pneumonia","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Verbal","Verbal","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Viral Encephalitis","Viral Encephalitis","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Within 1 Hour","Within 1 Hour","N/A","Misc",false);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"Yes MSF Staff","Yes MSF Staff","N/A","Misc",false);

-- adding concept sets

call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Assessment","COVID-19 Assessment","N/A","ConvSet",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Initial Assessment","Initial Assessment","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, COVID-19 Testing","COVID-19 Testing","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Patient Vitals at Arrival","Patient Vitals at Arrival","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Physical Examination","Physical Examination","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Initial Lab and Radiology Examinations","Initial Lab and Radiology Examinations","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Disposition Section","Disposition","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Discharge Assessment","Discharge Assessment","N/A","Misc",TRUE);
call add_concept(@concept_id,@concept_short_id,@concept_full_id,"CV, Laboratory Tests During Hospitalization","Laboratory Tests During Hospitalization","N/A","Misc",TRUE);



-- Adding Numeric concepts to the concept Numeric table

INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Weight"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"kg",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Height"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"m",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Temp"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, RR"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"Bpm",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, SpO2 on room air"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, SpO2 on Oxygen"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, How Many Liters of Oxygen Per Min?"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"L/min",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Heart Rate"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Systolic BP"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"mmHg",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Diastolic BP"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"mmHg",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Days Since Onset of First Symptoms"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Gestational Age"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"weeks",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, HB"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"g/dl",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Glucose"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"g/dl",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Number of Days Under Invasive Mechanical Ventilation"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Number of Days Under Non Invasive Mechanical Ventilation"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);
INSERT INTO concept_numeric (concept_id,hi_absolute,hi_critical,hi_normal,low_absolute,low_critical,low_normal,units,precise,display_precision) VALUES ((select concept_id from concept_name where name = "CV, Number of Days in ICU"and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),NULL,NULL,NULL,NULL,NULL,NULL,"",1,1);



-- Adding Description of the  concepts to the concept description table

INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Weight" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"kg",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Height" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"m",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, RR" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Bpm",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, How Many Liters of Oxygen Per Min?" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"L/min",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Systolic BP" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"mmHg",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Diastolic BP" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"mmHg",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Signs and Symptoms at Admission" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"Check all that apply",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Gestational Age" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"weeks",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Co-Morbidities" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"specify main co-morbidities, and if present explain history and treatment",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Other Physical Examination Findings" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"including clinical signs of chronic or infectious diseases",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, HB" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"g/dl",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Glucose" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"g/dl",'en',1,now(),NULL,NULL,uuid());
INSERT INTO concept_description(concept_id,description,locale,creator,date_created,changed_by,date_changed,uuid) VALUES ((select concept_id from concept_name where name = "CV, Other Tests If Indicated" and concept_name_type = 'FULLY_SPECIFIED' and locale = 'en' and voided = 0),"e.g.. Blood Cultures, d’dimers, CRP",'en',1,now(),NULL,NULL,uuid());
