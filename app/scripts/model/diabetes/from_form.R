model.diabetes.fromForm.getRow <- function(input) {
  datarow <- data.frame(
    input$diabetesAge,
    input$diabetesGender,
    input$diabetesPolyuria,
    input$diabetesPolydipsia,
    input$diabetesSuddenWeightLoss,
    input$diabetesWeakness,
    input$diabetesPolyphagia,
    input$diabetesGenitalThrush,
    input$diabetesVisualBlurring,
    input$diabetesItching,
    input$diabetesIrritability,
    input$diabetesDelayedHealing,
    input$diabetesPartialParesis,
    input$diabetesMuscleStiffness,
    input$diabetesAlopecia,
    input$diabetesObesity
  )
  header <- c('Age','Gender','Polyuria','Polydipsia','sudden.weight.loss','weakness','Polyphagia','Genital.thrush','visual.blurring','Itching','Irritability','delayed.healing','partial.paresis','muscle.stiffness','Alopecia','Obesity')
  colnames(datarow) <- header
  model.diabetes.logisticRegression.preprocessData(datarow)
}

model.diabetes.fromForm.logisticRegression.predict <- function(classifier, testSet) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet
  )
  prediction <- ifelse(probPred > 0.5, 1, 0)
  prediction
}

model.diabetes.fromForm.knn.predict <- function (trainingSet, testSet) {
  trainingSet <- model.diabetes.knn.preprocessData(trainingSet)

  allRows <- rbind(trainingSet[,-ncol(trainingSet)], testSet)
  scaled <- model.diabetes.knn.scaleSet(allRows)

  train <- scaled[-nrow(scaled),]
  train$class <- trainingSet$class
  testSet <- scaled[nrow(scaled),]

  yPred <- knn(
    train = train[,-ncol(trainingSet)],
    test = testSet,
    cl = train[,ncol(trainingSet)],
    k = 5
  )

  yPred
}

model.diabetes.fromForm.decisionTreeClassifier.predict <- function(classifier, testSet) {
  probPred <- predict(classifier, newdata = testSet)

  prediction <- ifelse(probPred > 0.5, 1, 0)
  prediction
}
