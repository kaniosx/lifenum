model.heartFailure.knn.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.heartFailure.knn.scaleSet <- function (set) {
  set$age <- scale(set$age)
  set$creatinine_phosphokinase <- scale(set$creatinine_phosphokinase)
  set$ejection_fraction <- scale(set$ejection_fraction)
  set$platelets <- scale(set$platelets)
  set$serum_creatinine <- scale(set$serum_creatinine)
  set$serum_sodium <- scale(set$serum_sodium)

  set
}

model.heartFailure.knn.getSampleSplit <- function (data) {
  set.seed(Sys.time())

  split <- sample.split(data$DEATH_EVENT, SplitRatio = 0.75)
  split
}

model.heartFailure.knn.getConfusionMatrix <- function (dataset) {
  split <- model.heartFailure.knn.getSampleSplit(dataset)
  trainingSet <- subset(dataset, split == TRUE)
  testSet <- subset(dataset, split == FALSE)

  trainingSet <- trainingSet[,-grep('time',colnames(trainingSet))]
  testSet <- testSet[,-grep('time',colnames(testSet))]

  trainingSet <- model.heartFailure.knn.scaleSet(trainingSet)
  testSet <- model.heartFailure.knn.scaleSet(testSet)

  yPred <- knn(
    train = trainingSet[,-ncol(trainingSet)],
    test = testSet[,-ncol(testSet)],
    cl = trainingSet[,ncol(trainingSet)],
    k = 5
  )
  confusionMatrix <- table(testSet[, ncol(testSet)], yPred)

  confusionMatrix
}
