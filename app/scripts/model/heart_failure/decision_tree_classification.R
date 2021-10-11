model.heartFailure.decisionTreeClassification.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.heartFailure.decisionTreeClassification.getConfusionMatrix <- function (dataset) {
  split <- model.heartFailure.decisionTreeClassification.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]
  testSet <- testSet[,-grep('time',colnames(testSet))]

  classifier <- rpart(
    formula = DEATH_EVENT ~ .,
    data = trainingSet
  )

  yPred <- predict(classifier, newdata = testSet[,-ncol(testSet)])

  table(testSet$DEATH_EVENT, ifelse(yPred > 0.5, 1, 0))
}

model.heartFailure.decisionTreeClassification.getClassifier <- function (trainingSet) {
  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]

  rpart(
    formula = DEATH_EVENT ~ .,
    data = trainingSet
  )
}