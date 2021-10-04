model.heartFailure.logisticRegression.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.heartFailure.logisticRegression.getClassifier <- function (trainingSet) {
  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]

  classifier <- glm(
    formula = DEATH_EVENT ~ .,
    family = binomial,
    data = trainingSet
  )

  classifier
}

model.heartFailure.logisticRegression.getConfusionMatrix <- function (classifier, testSet) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet[-ncol(testSet)]
  )

  yPred <- ifelse(probPred > 0.5, 1, 0)
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}
