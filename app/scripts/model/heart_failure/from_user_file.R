model.heartFailure.fromUserFile.load <- function (userFile) {
  read.csv(userFile, sep = ',')
}

model.heartFailure.fromUserFile.predict <- function (classifier, dataset, modelType) {
  if (modelType == 'logisticRegression') {
    return(model.heartFailure.fromUserFile.logisticRegression.predict(classifier, dataset))
  }

  if (modelType == 'kNeighborsClassifier') {
    trainSet <- data.heartFailureData
    trainSet <- trainSet
    return(model.heartFailure.fromUserFile.knn.predict(trainSet, dataset))
  }
}

model.heartFailure.fromUserFile.logisticRegression.predict <- function (classifier, dataset) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = dataset
  )
  dataset$DEATH_EVENT <- ifelse(probPred > 0.5, 1, 0)

  dataset
}

model.heartFailure.fromUserFile.knn.predict <- function (trainSet, testSet) {
  trainSet <- trainSet[,-grep('time',colnames(trainSet))]
  deathColumn <- trainSet$DEATH_EVENT
  allRows <- rbind(trainSet[,-ncol(trainSet)], testSet)
  scaled <- model.heartFailure.knn.scaleSet(allRows)

  trainSet <- scaled[1:-nrow(trainSet),]
  trainSet$DEATH_EVENT <- deathColumn

  testSet <- scaled[nrow(trainSet):nrow(scaled),]

  yPred <- knn(
    train = trainSet[,-ncol(trainSet)],
    test = testSet,
    cl = trainSet[,ncol(trainSet)],
    k = 5
  )

  testSet$DEATH_EVENT <- yPred
  testSet
}

model.heartFailure.fromUserFile.download <- function () {

}

model.heartFailure.fromUserFile.downloadTemplate <- function () {

}
