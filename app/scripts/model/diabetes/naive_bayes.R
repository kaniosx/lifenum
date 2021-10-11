model.diabetes.naiveBayes.preprocessData <- function (data) {
  data[,3:ncol(data)-1] <- as.integer(data == 'Yes')
  data[2] <- lapply(data[2], function(x) as.integer(x == 'Male'))
  data[ncol(data)] <- lapply(data[ncol(data)], function(x) as.integer(x == 'Positive'))
  data
}

model.diabetes.naiveBayes.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$class, SplitRatio = 0.75)
  split
}

model.diabetes.naiveBayes.getConfusionMatrix <- function (dataset) {
  dataset <- model.diabetes.naiveBayes.preprocessData(dataset)

  split <- model.diabetes.naiveBayes.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  classifier <- naiveBayes(
    x = trainingSet[-ncol(trainingSet)],
    y = trainingSet$class
  )

  yPred <- predict(classifier, newdata = testSet[-ncol(testSet)])

  table(testSet$class, yPred)
}

model.diabetes.naiveBayes.getClassifier <- function (trainingSet) {
  naiveBayes(
    x = trainingSet[-ncol(trainingSet)],
    y = trainingSet$class
  )
}
