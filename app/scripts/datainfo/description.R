# Description module

description.heartFailureDescription <- '
https://www.kaggle.com/sanchitakarmakar/heart-failure-prediction-visualization
  <h3>Heart Failure Prediction Visualization</h3>
  <hr>
  <p>Cardiovascular diseases (CVDs) are the number 1 cause of death globally, taking an estimated 17.9 million lives each year, which accounts for 31% of all deaths worlwide. Heart failure is a common event caused by CVDs and this dataset contains 12 features that can be used to predict mortality by heart failure.</p>
  <p>Most cardiovascular diseases can be prevented by addressing behavioural risk factors such as tobacco use, unhealthy diet and obesity, physical inactivity and harmful use of alcohol using population-wide strategies.</p>
  <p>People with cardiovascular disease or who are at high cardiovascular risk (due to the presence of one or more risk factors such as hypertension, diabetes, hyperlipidaemia or already established disease) need early detection and management wherein a machine learning model can be of great help.</p>
  <h4>Data record consists of thirteen (13) clinical features:</h4>
  <ul>
    <li>age: age of the patient (years)</li>
    <li>anaemia: decrease of red blood cells or hemoglobin (boolean)</li>
    <li>high blood pressure: if the patient has hypertension (boolean)</li>
    <li>creatinine phosphokinase (CPK): level of the CPK enzyme in the blood (mcg/L)</li>
    <li>diabetes: if the patient has diabetes (boolean)</li>
    <li>ejection fraction: percentage of blood leaving the heart at each contraction (percentage)</li>
    <li>platelets: platelets in the blood (kiloplatelets/mL)</li>
    <li>sex: woman or man (binary)</li>
    <li>serum creatinine: level of serum creatinine in the blood (mg/dL)</li>
    <li>serum sodium: level of serum sodium in the blood (mEq/L)</li>
    <li>smoking: if the patient smokes or not (boolean)</li>
    <li>time: follow-up period (days)</li>
    <li>[target] death event: if the patient deceased during the follow-up period (boolean)</li>
  </ul>
'

description.diabetesDescription <- '
https://www.kaggle.com/ishandutta/early-stage-diabetes-risk-prediction-dataset
  <h3>Early Stage Diabetes Prediction</h4>
  <hr>
  <h4>About Data</h4>
  <p>This dataset contains the sign and symptpom data of newly diabetic or would be diabetic patient. This has been collected using direct questionnaires from the patients of Sylhet Diabetes Hospital in Sylhet, Bangladesh and approved by a doctor.</p>
  <h4>Features of the dataset</h4>
  <p>The dataset consist of total 15 features and one target variable named class.</p>

  <ul>
    <li>1. Age: Age in years ranging from (20years to 65 years)</li>
    <li>2. Gender: Male/Female</li>
    <li>3. Polyuria: Yes/No</li>
    <li>4. Polydipsia: Yes/No</li>
    <li>5. Sudden weight loss: Yes/No</li>
    <li>6. Weakness: Yes/No</li>
    <li>7. Polyphagia: Yes/No</li>
    <li>8. Genital Thrush: Yes/No</li>
    <li>9. Visual blurring: Yes/No</li>
    <li>10. Itching: Yes/No</li>
    <li>11. Irritability: Yes/No</li>
    <li>12. Delayed healing: Yes/No</li>
    <li>13. Partial Paresis: Yes/No</li>
    <li>14. Muscle stiffness: yes/No</li>
    <li>15. Alopecia: Yes/ No</li>
    <li>16. Obesity: Yes/ No</li>
  </ul>
  Class: Positive / Negative
'

description.describeData <- function (key) {
  switch(
    key,
    'heartFailure' = description.heartFailureDescription,
    'diabetes' = description.diabetesDescription
  )
}

