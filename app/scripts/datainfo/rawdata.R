# Raw view module

rawdata.load <- function (key) {
  switch(
    key,
    'breastCancer' = data.breastCancerData,
    'heartFailure' = data.heartFailureData,
    'diabetes' = data.diabetesData
  )
}
