# Call Libraries
install.packages("rpart")
library(rpart)

install.packages("rpart.plot")
library(rpart.plot)

install.packages("randomForest")
library(randomForest)

# Decision Tree Model
r = rpart(Species ~ ., data = iris)

# Random Forest Model
f = randomForest(Species ~ ., data = iris)
varUsed(f)
varImpPlot(f)
treesize(f)

# Random Forest Predict
newd = data.frame(Sepal.Length = c(5.11, 7.01, 6.32), Sepal.Width = c(3.51, 3.2, 3.31),
                  Petal.Length = c(1.4, 4.71, 6.02), Petal.Width = c(0.19, 1.4, 2.49))
predict(f, newdata = newd)

# Set Predict Type
predict(f, newdata = newd, type = 'prob')
predict(f, newdata = newd, type = 'vote', norm.votes = FALSE)

# Set Random Forest Hyper Parameter
small_Forest = randomForest(Species ~., data = iris, ntree = 20, nodesize = 6, maxnodes = 12)
treesize(small_Forest)

small_Forest

# Assignment
newd = data.frame(Sepal.Length = c(4.7, 5.31, 6.4, 5.2, 6.3), Sepal.Width = c(3.2, 3.7, 3.22, 2.71, 3.3),
                  Petal.Length = c(1.3, 1.5, 4.5, 3.9, 6.1), Petal.Width = c(0.22, 0.2, 1.5, 1.4, 2.5))
predict(f, newdata = newd, type = 'prob')
predict(small_Forest, newdata = newd, type = 'prob')
