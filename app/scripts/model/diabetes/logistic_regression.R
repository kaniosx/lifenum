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
  trainingSet$Age <- scale(trainingSet$Age)

  classifier <- glm(
    formula = class ~ .,
    family = binomial,
    data = trainingSet
  )

  classifier
}

model.diabetes.logisticRegression.getConfusionMatrix <- function (classifier, testSet) {
  testSet$Age <- scale(testSet$Age)
  
  probPred <- predict(
    classifier,
    type = 'response',
    newdata = testSet[-ncol(testSet)]
  )

  yPred <- ifelse(probPred > 0.5, 1, 0)
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}

# model.diabetes.logisticRegression.getClassifier2 <- function () {
#   data <- model.diabetes.logisticRegression.preprocessData(data.diabetesData)
#   
#   set.seed(Sys.time())
#   
#   split <- sample.split(data$class, SplitRatio = 0.75)
#   trainingSet <- subset(data, split == TRUE)
#   testSet <- subset(data, split == FALSE)
#   
#   trainingSet$Age <- scale(trainingSet$Age)
#   testSet$Age <- scale(testSet$Age)
#   
#   classifier <- glm(
#     formula = class ~ .,
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
#   confusionMatrix <- table(testSet[, ncol(testSet)], yPred)
# 
#   return(confusionMatrix)
# }
