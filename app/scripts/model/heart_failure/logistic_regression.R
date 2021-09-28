model.diabetes.heartFailure.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.diabetes.heartFailure.getClassifier <- function (trainingSet) {
  trainingSet$age <- scale(trainingSet$age)
  trainingSet$creatinine_phosphokinase <-
    scale(trainingSet$creatinine_phosphokinase)
  trainingSet$ejection_fraction <- scale(trainingSet$ejection_fraction)
  trainingSet$platelets <- scale(trainingSet$platelets)
  trainingSet$serum_creatinine <- scale(trainingSet$serum_creatinine)
  trainingSet$serum_sodium <- scale(trainingSet$serum_sodium)

  classifier <- glm(
    formula = DEATH_EVENT ~ .,
    family = binomial,
    data = trainingSet
  )

  classifier
}

model.diabetes.heartFailure.getConfusionMatrix <- function (classifier, testSet) {
  testSet$age <- scale(testSet$age)
  testSet$creatinine_phosphokinase <- scale(testSet$creatinine_phosphokinase)
  testSet$ejection_fraction <- scale(testSet$ejection_fraction)
  testSet$platelets <- scale(testSet$platelets)
  testSet$serum_creatinine <- scale(testSet$serum_creatinine)
  testSet$serum_sodium <- scale(testSet$serum_sodium)

  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet[-ncol(testSet)]
  )

  yPred <- ifelse(probPred > 0.5, 1, 0)
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}

# model.heartFailure.logisticRegression.getClassifier <- function () {
#   data <- read.csv('data/heartfailure.csv')
#   # data <- data[lapply(data, length) > 0]
#
#   set.seed(Sys.time())
#
#   split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
#   trainingSet <- subset(data, split == TRUE)
#   testSet <- subset(data, split == FALSE)
#
#   trainingSet$age <- scale(trainingSet$age)
#   trainingSet$creatinine_phosphokinase <-
#     scale(trainingSet$creatinine_phosphokinase)
#   trainingSet$ejection_fraction <- scale(trainingSet$ejection_fraction)
#   trainingSet$platelets <- scale(trainingSet$platelets)
#   trainingSet$serum_creatinine <- scale(trainingSet$serum_creatinine)
#   trainingSet$serum_sodium <- scale(trainingSet$serum_sodium)
#
#   testSet$age <- scale(testSet$age)
#   testSet$creatinine_phosphokinase <- scale(testSet$creatinine_phosphokinase)
#   testSet$ejection_fraction <- scale(testSet$ejection_fraction)
#   testSet$platelets <- scale(testSet$platelets)
#   testSet$serum_creatinine <- scale(testSet$serum_creatinine)
#   testSet$serum_sodium <- scale(testSet$serum_sodium)
#
#   classifier <- glm(
#     formula = DEATH_EVENT ~ .,
#     family = binomial,
#     data = trainingSet
#   )
#
#   probPred <- predict(
#     classifier,
#     type = 'response',
#     newdata = testSet[-ncol(testSet)]
#   )
#
#   yPred <- ifelse(probPred > 0.5, 1, 0)
#
#   confusionMatrix <- table(testSet[, ncol(testSet)], yPred)
#
#   return(confusionMatrix)
# }