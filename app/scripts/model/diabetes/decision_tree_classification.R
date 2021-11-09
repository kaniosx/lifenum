model.diabetes.decisionTreeClassification.preprocessData <- function (data) {
  data[,3:ncol(data)-1] <- as.integer(data == 'Yes')
  data[2] <- lapply(data[2], function(x) as.integer(x == 'Male'))
  data[ncol(data)] <- lapply(data[ncol(data)], function(x) as.integer(x == 'Positive'))
  data
}

model.diabetes.decisionTreeClassification.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$class, SplitRatio = 0.75)
  split
}

model.diabetes.decisionTreeClassification.getConfusionMatrix <- function (dataset) {
  dataset <- model.diabetes.decisionTreeClassification.preprocessData(dataset)

  split <- model.diabetes.decisionTreeClassification.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  classifier <- rpart(
    formula = class ~ .,
    data = trainingSet
  )
  
  yPred <- predict(classifier, newdata = testSet[,-ncol(testSet)])

  table(testSet$class, ifelse(yPred > 0.5, 1, 0))
}


model.diabetes.decisionTreeClassification.getClassifier <- function (trainingSet) {
  rpart(
    formula = class ~ .,
    data = trainingSet
  )
}

model.diabetes.decisionTreeClassification.getPrediction <- function(trainingSet, testSet) {
  classifier <- rpart(
    formula = class ~ .,
    data = trainingSet
  )
  
  predict(classifier, newdata = testSet[,-ncol(testSet)])
}
