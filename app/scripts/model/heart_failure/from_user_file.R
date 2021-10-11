model.heartFailure.fromUserFile.load <- function (userFile) {
  read.csv(userFile, sep = ',')
}

model.heartFailure.fromUserFile.predict <- function (classifier = NULL, dataset, modelType) {
  if (modelType == 'logisticRegression') {
    return(model.heartFailure.fromUserFile.logisticRegression.predict(classifier, dataset))
  }

  if (modelType == 'kNeighborsClassifier') {
    trainSet <- data.heartFailureData
    return(model.heartFailure.fromUserFile.knn.predict(trainSet, dataset))
  }

  if (modelType == 'decisionTreeClassifier') {
    return(model.heartFailure.fromUserFile.decisionTreeClassification.predict(classifier, dataset))
  }

  if (modelType == 'naiveBayes') {
    return(model.heartFailure.fromUserFile.naiveBayes.predict(classifier, dataset))
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

  trainSet <- scaled[1:nrow(trainSet)-nrow(testSet),]
  trainSet$DEATH_EVENT <- deathColumn

  testSet <- scaled[nrow(trainSet)+1:nrow(scaled),]

  yPred <- knn(
    train = trainSet[,-ncol(trainSet)],
    test = testSet,
    cl = trainSet[,ncol(trainSet)],
    k = 5
  )

  testSet$DEATH_EVENT <- yPred
  testSet
}

model.heartFailure.fromUserFile.decisionTreeClassification.predict <- function (classifier, dataset) {
  probPred <- predict(
    classifier,
    newdata = dataset
  )
  dataset$DEATH_EVENT <- ifelse(probPred > 0.5, 1, 0)

  dataset
}

model.heartFailure.fromUserFile.naiveBayes.predict <- function (classifier, dataset) {
  dataset$DEATH_EVENT <- predict(
    classifier,
    newdata = dataset
  )

  dataset
}

model.heartFailure.fromUserFile.download <- function () {

}

model.heartFailure.fromUserFile.downloadTemplate <- function () {

}
