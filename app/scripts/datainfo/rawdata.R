rawdata.breastCancerData <- read.csv('data/breastcancer.data')

rawdata.covid19Data <- read.csv('data/covid19.csv')

rawdata.heartFailureData <- read.csv('data/heartfailure.csv')

rawdata.load <- function (key) {
  switch(
    key,
    'breastCancer' = rawdata.breastCancerData,
    'covid19' = rawdata.covid19Data,
    'heartFailure' = rawdata.heartFailureData
  )
}
