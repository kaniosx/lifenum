model.diabetes.logisticRegression.preprocessData <- function(data) {
  data[,3:ncol(data)] <- as.integer(data == 'Yes')
  data[2] <- lapply(data[2], function(x) as.integer(x == 'Male'))
  data
}

model.diabetes.logisticRegression.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$class, SplitRatio = 0.75)
  split
}

model.diabetes.logisticRegression.getClassifier <- function (trainingSet) {
  classifier <- glm(
    formula = class ~ .,
    family = binomial,
    data = trainingSet
  )

  classifier
}

model.diabetes.logisticRegression.getConfusionMatrix <- function (classifier, testSet) {
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet[-ncol(testSet)]
  )

  yPred <- ifelse(probPred > 0.5, 1, 0)
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}

model.diabetes.logisticRegression.getPrediction <- function(trainingSet, testSet) {
  classifier <- glm(
    formula = class ~ .,
    family = binomial,
    data = trainingSet
  )
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet[-ncol(testSet)]
  )
  
  ifelse(probPred > 0.5, 1, 0)
}
