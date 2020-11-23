library(rpart)
r = rpart(Species ~ ., data = iris)

summary(r)

install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(r)

install.packages("randomForest")
library(randomForest)
f = randomForest(Species ~ ., data = iris)
f
plot(f)

# Assignment
library(randomForest)
f = randomForest(Species ~ ., data = iris)
f
plot(f)
