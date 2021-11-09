model.heartFailure.naiveBayes.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.heartFailure.naiveBayes.getConfusionMatrix <- function (dataset) {
  split <- model.heartFailure.naiveBayes.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]
  testSet <- testSet[,-grep('time',colnames(testSet))]

  classifier <- naiveBayes(
    x = trainingSet[-ncol(trainingSet)],
    y = trainingSet$DEATH_EVENT
  )

  yPred <- predict(classifier, newdata = testSet[-ncol(testSet)])

  table(testSet$DEATH_EVENT, yPred)
}

model.heartFailure.naiveBayes.getClassifier <- function(trainingSet) {
  naiveBayes(
    x = trainingSet[-ncol(trainingSet)],
    y = trainingSet$DEATH_EVENT
  )
}

model.heartFailure.naiveBayes.getPrediction <- function(trainingSet, testSet) {
  classifier <- naiveBayes(
    x = trainingSet[-ncol(trainingSet)],
    y = trainingSet$DEATH_EVENT
  )
  
  predict(classifier, newdata = testSet[-ncol(testSet)])
}
