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

model.diabetes.fromForm.predict <- function(classifier, testSet) {
  #testSet$Age <- scale(testSet$Age)

  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet
  )
  probPred
}
