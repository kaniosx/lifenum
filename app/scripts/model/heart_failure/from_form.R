model.heartFailure.fromForm.getRow <- function(input) {
  df <- data.frame(
    input$heartFailureAge,
    input$heartFailureGender,
    input$heartFailureAnaemia,
    input$heartFailureCreatininePhosphokinase,
    input$heartFailureDiabetes,
    input$heartFailureEjectionFraction,
    input$heartFailureHighBloodPreasure,
    input$heartFailurePlatelets,
    input$heartFailureSerumCreatinine,
    input$heartFailureSerumSodium,
    input$heartFailureSmoking
  )

  header <- c('age', 'sex', 'anaemia', 'creatinine_phosphokinase', 'diabetes', 'ejection_fraction', 'high_blood_pressure', 'platelets', 'serum_creatinine', 'serum_sodium', 'smoking')
  colnames(df) <- header

  df$anaemia <- as.integer(as.character(df$anaemia))
  df$diabetes <- as.integer(as.character(df$diabetes))
  df$sex <- as.integer(as.character(df$sex))
  df$smoking <- as.integer(as.character(df$smoking))
  df$high_blood_pressure <- as.integer(as.character(df$high_blood_pressure))

  df
}

model.heartFailure.fromForm.logisticRegression.predict <- function(classifier, testSet) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet
  )

  return(ifelse(probPred > 0.5, 1, 0))
}

model.heartFailure.fromForm.knn.predict <- function(trainingSet, testSet) {
  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]

  allRows <- rbind(trainingSet[,-ncol(trainingSet)], testSet)
  scaled <- model.heartFailure.knn.scaleSet(allRows)

  train <- scaled[-nrow(scaled),]
  train$DEATH_EVENT <- trainingSet$DEATH_EVENT
  testSet <- scaled[nrow(scaled),]

  yPred <- knn(
    train = train[,-ncol(trainingSet)],
    test = testSet,
    cl = train[,ncol(trainingSet)],
    k = 5
  )

  yPred
}

model.heartFailure.fromForm.decisionTreeClassification.predict <- function(classifier, testSet) {
  probPred <- predict(
    classifier,
    newdata = testSet
  )

  return(ifelse(probPred > 0.5, 1, 0))
}

