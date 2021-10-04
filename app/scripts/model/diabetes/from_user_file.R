model.diabetes.fromUserFile.load <- function (userFile) {
  read.csv(userFile, sep = ',')
}

model.diabetes.fromUserFile.predict <- function (classifier = NULL, dataset, modelType) {
  if (modelType == 'logisticRegression') {
    return(model.diabetes.fromUserFile.logisticRegression.predict(classifier, dataset))
  }

  if (modelType == 'kNeighborsClassifier') {
    data <- data.diabetesData
    return(model.diabetes.fromUserFile.knn.predict(data, dataset))
  }
}

model.diabetes.fromUserFile.logisticRegression.predict <- function (classifier, dataset) {
  dataset <- model.diabetes.logisticRegression.preprocessData(dataset)
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = dataset
  )
  dataset$class <- ifelse(probPred > 0.5, 1, 0)

  dataset
}

model.diabetes.fromUserFile.knn.predict <- function (trainSet, testSet) {
  trainSet <- model.diabetes.knn.preprocessData(trainSet)
  testSet <- model.diabetes.knn.preprocessData(testSet)
  allRows <- rbind(trainSet[,-ncol(trainSet)], testSet)
  scaled <- model.diabetes.knn.scaleSet(allRows)


  train <- scaled[seq_len(nrow(trainSet)),]
  train <- cbind(train, trainSet$class)
  test <- scaled[(nrow(trainSet)+1):nrow(scaled),]

  yPred <- knn(
    train = train[,-ncol(train)],
    test = test,
    cl = train[,ncol(train)],
    k = 5
  )

  testSet$class <- yPred
  testSet
}

model.diabetes.fromUserFile.download <- function () {

}

model.diabetes.fromUserFile.downloadTemplate <- function () {

}