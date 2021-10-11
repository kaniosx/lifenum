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

    if (modelType == 'kNeighborsClassifier') {
      return(
        model.diabetes.knn.getConfusionMatrix(data.diabetesData)
      )
    }

    if (modelType == 'decisionTreeClassifier') {
      return(
        model.diabetes.decisionTreeClassification.getConfusionMatrix(data.diabetesData)
      )
    }

    if (modelType == 'naiveBayes') {
      return(
        model.diabetes.naiveBayes.getConfusionMatrix(data.diabetesData)
      )
    }
  }
  
  if (moduleName == 'heartFailure') {
    data <- data.heartFailureData

    if (modelType == 'logisticRegression') {
      split <- model.heartFailure.logisticRegression.getSampleSplit(data)

      trainingSet <- subset(data, split == TRUE)
      testSet <- subset(data, split == FALSE)
      classifier <- model.heartFailure.logisticRegression.getClassifier(trainingSet)

      return(
        model.heartFailure.logisticRegression.getConfusionMatrix(
          classifier, testSet
        )
      )
    }

    if (modelType == 'kNeighborsClassifier') {
      return(
        model.heartFailure.knn.getConfusionMatrix(data)
      )
    }

    if (modelType == 'decisionTreeClassifier') {
      return(
        model.heartFailure.decisionTreeClassification.getConfusionMatrix(data)
      )
    }

    if (modelType == 'naiveBayes') {
      return(
        model.heartFailure.naiveBayes.getConfusionMatrix(data)
      )
    }
  }
}

model.getClassifier <- function (modelType, moduleName) {
  if (moduleName == 'diabetes') {
    data <- model.diabetes.decisionTreeClassification.preprocessData(data.diabetesData)

    if (modelType == 'logisticRegression') {
      return(model.diabetes.logisticRegression.getClassifier(data))
    }

    if (modelType == 'decisionTreeClassifier') {
      return(model.diabetes.decisionTreeClassification.getClassifier(data))
    }

    if (modelType == 'naiveBayes') {
      return(model.diabetes.naiveBayes.getClassifier(data))
    }
  }

  if (moduleName == 'heartFailure') {
    data <- data.heartFailureData

    if (modelType == 'logisticRegression') {
      return(model.heartFailure.logisticRegression.getClassifier(data))
    }

    if (modelType == 'decisionTreeClassifier') {
      return(model.heartFailure.decisionTreeClassification.getClassifier(data))
    }

    if (modelType == 'naiveBayes') {
      data <- data[,-grep('time',colnames(data))]
      return(model.heartFailure.naiveBayes.getClassifier(data))
    }
  }
}

model.predictFromForm.getPredicition <- function (input) {
  data <- model.predictFromForm.getRow(input)

  if (input$dataset == 'diabetes') {
    if (input$modelType == 'logisticRegression') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.diabetes.fromForm.logisticRegression.predict(classifier, data))
    }

    if (input$modelType == 'kNeighborsClassifier') {
      return(model.diabetes.fromForm.knn.predict(data.diabetesData, data))
    }

    if (input$modelType == 'decisionTreeClassifier') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.diabetes.fromForm.decisionTreeClassifier.predict(classifier, data))
    }

    if (input$modelType == 'naiveBayes') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.diabetes.fromForm.naiveBayes.predict(classifier, data))
    }
  }

  if (input$dataset == 'heartFailure') {
    if (input$modelType == 'logisticRegression') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.heartFailure.fromForm.logisticRegression.predict(classifier, data))
    }

    if (input$modelType == 'kNeighborsClassifier') {
      return(model.heartFailure.fromForm.knn.predict(data.heartFailureData, data))
    }

    if (input$modelType == 'decisionTreeClassifier') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.heartFailure.fromForm.decisionTreeClassification.predict(classifier, data))
    }

    if (input$modelType == 'naiveBayes') {
      classifier <- model.getClassifier(input$modelType, input$dataset)
      return(model.heartFailure.fromForm.naiveBayes.predict(classifier, data))
    }
  }
}

model.predictFromForm.getRow <- function(input) {
  if (input$dataset == 'diabetes') {
    return(model.diabetes.fromForm.getRow(input))
  }

  if (input$dataset == 'heartFailure') {
    return(model.heartFailure.fromForm.getRow(input))
  }
}

model.predictFromUserFile.getData <- function (datasetName, modelType, filePath) {
  if (datasetName == 'diabetes') {
    data <- model.diabetes.fromUserFile.load(filePath)

    if (modelType == 'logisticRegression' || modelType == 'decisionTreeClassifier' || modelType == 'naiveBayes') {
      classifier <- model.getClassifier(modelType, datasetName)
      return(model.diabetes.fromUserFile.predict(classifier = classifier, data, modelType))
    }

    if (modelType == 'kNeighborsClassifier') {
      return(model.diabetes.fromUserFile.predict(NULL, data, modelType))
    }
  }

  if (datasetName == 'heartFailure') {
    data <- model.heartFailure.fromUserFile.load(filePath)

    if (modelType == 'logisticRegression' || modelType == 'decisionTreeClassifier' || modelType == 'naiveBayes') {
      classifier <- model.getClassifier(modelType, datasetName)
      return(model.heartFailure.fromUserFile.predict(classifier, data, modelType))
    }

    if (modelType == 'kNeighborsClassifier') {
      return(model.heartFailure.fromUserFile.predict(classifier = NULL, data, modelType))
    }
  }
}
