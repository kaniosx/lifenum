model.diabetes.fromUserFile.load <- function (userFile) {
  read.csv(userFile, sep = ',')
}

model.diabetes.fromUserFile.predict <- function (classifier, dataset, modelType) {
  if (modelType == 'logisticRegression') {
    return(model.diabetes.fromUserFile.logisticRegression.predict(classifier, dataset))
  }
}

model.diabetes.fromUserFile.logisticRegression.predict <- function (classifier, dataset) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = dataset
  )
  dataset$class <- ifelse(probPred > 0.5, 1, 0)

  dataset
}

model.diabetes.fromUserFile.download <- function () {

}

model.diabetes.fromUserFile.downloadTemplate <- function () {

}