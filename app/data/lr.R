library(caTools)

data <- read.csv('data/diabetes.csv', sep = ',')

data[,3:ncol(data)] <- as.integer(data == 'Yes')
data[2] <- lapply(data[2], function(x) as.integer(x == 'Male'))

set.seed(Sys.time())

split <- sample.split(data$class, SplitRatio = 0.998)
trainingSet <- subset(data, split == TRUE)
testSet <- subset(data, split == FALSE)

print(class(trainingSet$Age))
#FS
trainingSet$Age <- scale(trainingSet$Age)
testSet$Age <- scale(testSet$Age)


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

print(probPred)

# yPred <- ifelse(probPred > 0.5, 1, 0)
# 
# print(yPred)

# confusionMatrix <- table(testSet[, ncol(testSet)], yPred)
