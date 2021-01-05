# Description module

description.breastCancerDescription <- '
  breastCancerDescription
'

description.covid19Description <- '
  Covid19
'

description.heartFailureDescription <- '
  <h4>Thirteen (13) clinical features:</h4>
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

description.describeData <- function (key) {
  switch(
    key,
    'breastCancer' = description.breastCancerDescription,
    'covid19' = description.covid19Description,
    'heartFailure' = description.heartFailureDescription
  )
}

