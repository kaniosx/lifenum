summary.summarize <- function (dataset) {
  data <- switch(
    dataset,
    'diabetes' = data.diabetesData,
    'heartFailure' = data.heartFailureData
  )
  summary(data)
}
