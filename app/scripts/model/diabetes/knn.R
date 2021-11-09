model.diabetes.knn.preprocessData <- function(data) {
  data[4:ncol(data)-1] <- as.integer(data == 'Yes')
  data[2] <- lapply(data[2], function(x) as.integer(x == 'Male'))
  data[ncol(data)] <- lapply(data[ncol(data)], function(x) as.integer(x == 'Positive'))
  data
}

model.diabetes.knn.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$class, SplitRatio = 0.75)
  split
}

model.diabetes.knn.scaleSet <- function (set) {
  set$Age <- scale(set$Age)
  set
}

model.diabetes.knn.getConfusionMatrix <- function (dataset) {
  dataset <- model.diabetes.knn.preprocessData(dataset)

  split <- model.diabetes.knn.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  trainingSet <- model.diabetes.knn.scaleSet(trainingSet)
  testSet <- model.diabetes.knn.scaleSet(testSet)

  yPred <- knn(
    train = trainingSet[,-ncol(trainingSet)],
    test = testSet[,-ncol(testSet)],
    cl = trainingSet[,ncol(trainingSet)],
    k = 5
  )
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}


model.diabetes.knn.getPrediction <- function(trainingSet, testSet) {
  knn(
    train = trainingSet[,-ncol(trainingSet)],
    test = testSet[,-ncol(testSet)],
    cl = trainingSet[,ncol(trainingSet)],
    k = 5
  )
}

