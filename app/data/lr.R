library(plyr)

data <- read.csv('heartfailure.csv', sep = ',')

dead <- data[data$DEATH_EVENT == 1,]

p <- ggplot(data, aes(x = age)) +
  ggtitle('Age vs death event') +
  geom_histogram(data = data, fill = 'red', alpha = 0.4) +
  geom_histogram(data = dead, fill = 'blue', alpha = 0.4)

p