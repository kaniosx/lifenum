model.trainModel <- function(modelType, moduleName) {
  if (moduleName == 'diabetes') {
    if (modelType == 'logisticRegression') {
      data <- model.diabetes.logisticRegression.preprocessData(data.diabetesData)
      split <- model.diabetes.logisticRegression.getSampleSplit(data)

      trainingSet <- subset(data, split == TRUE)
      testSet <- subset(data, split == FALSE)
      classifier <- model.diabetes.logisticRegression.getClassifier(trainingSet)
      return(
        model.diabetes.logisticRegression.getConfusionMatrix(
          classifier, testSet
        )
      )
    }
  }
  
  if (moduleName == 'heartFailure') {
    if (modelType == 'logisticRegression') {
      data <- data.heartFailureData
      split <- model.diabetes.heartFailure.getSampleSplit(data)

      trainingSet <- subset(data, split == TRUE)
      testSet <- subset(data, split == FALSE)
      classifier <- model.diabetes.heartFailure.getClassifier(trainingSet)

      return(
        model.diabetes.heartFailure.getConfusionMatrix(
          classifier, testSet
        )
      )
    }
  }
}

model.getClassifier <- function (modelType, moduleName) {
  if (moduleName == 'diabetes') {
    if (modelType == 'logisticRegression') {
      data <- model.diabetes.logisticRegression.preprocessData(data.diabetesData)
      return(model.diabetes.logisticRegression.getClassifier(data))
    }
  }

  if (moduleName == 'heartFailure') {
    if (modelType == 'logisticRegression') {
    }
  }
}

