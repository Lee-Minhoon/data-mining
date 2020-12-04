# Assignment
library(rpart)
library(randomForest)
library(caret)

f = randomForest(Species ~ ., data = iris, ntree = 1)
f_pred = predict(f, iris)

cm = confusionMatrix(f_pred, iris$Species)
print(paste("Accuracy of ntree 1 : ",
            cm[3]$overall["Accuracy"] * 100, "%", sep = ""))

f = randomForest(Species ~ ., data = iris, ntree = 5)
f_pred = predict(f, iris)
cm = confusionMatrix(f_pred, iris$Species)
print(paste("Accuracy of ntree 5 : ",
            cm[3]$overall["Accuracy"] * 100, "%", sep = ""))

f = randomForest(Species ~ ., data = iris, ntree = 7)
f_pred = predict(f, iris)
cm = confusionMatrix(f_pred, iris$Species)
print(paste("Accuracy of ntree 7 : ",
            cm[3]$overall["Accuracy"] * 100, "%", sep = ""))

f = randomForest(Species ~ ., data = iris, ntree = 9)
f_pred = predict(f, iris)
cm = confusionMatrix(f_pred, iris$Species)
print(paste("Accuracy of ntree 9 : ",
            cm[3]$overall["Accuracy"] * 100, "%", sep = ""))
