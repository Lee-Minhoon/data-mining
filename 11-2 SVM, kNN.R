# Call Library
install.packages("e1071")
library(e1071)

# Support Vector Machine
s = svm(Species ~ ., data = iris)
print(s)

table(predict(s, iris), iris$Species)

# Polynomial Kernel
s = svm(Species ~ ., data = iris, kernel = 'polynomial')
p = predict(s, iris)
table(p, iris$Species)

# SVM Hyper Parameter (Margin <-> Generalization, Trade Off)
s = svm(Species ~ ., data = iris, cost = 100)
p = predict(s, iris)
table(p, iris$Species)

s = svm(Species ~ ., data = iris, cost = 0.01)
p = predict(s, iris)
table(p, iris$Species)

s = svm(Species ~ ., data = iris, cost = 200)
p = predict(s, iris)
table(p, iris$Species)

# k-nearest neighbor
library(class)
train = iris
test = data.frame(Sepal.Length = c(5.11, 7.01, 6.32), Sepal.Width = c(3.51, 3.2, 3.31),
                  Petal.Length = c(1.4, 4.71, 6.02), Petal.Width = c(0.19, 1.4, 2.49))
k = knn(train[, 1:4], test, train$Species, k = 5)
k

install.packages("caret")
library(caret)
r = train(Species ~ ., data = iris, method = 'rpart')
t = train(Species ~ ., data = iris, method = 'rf')
s = train(Species ~ ., data = iris, method = 'svmRadial')
k = train(Species ~ ., data = iris, method = 'knn')

# Assignment
s = svm(Species ~ ., data = iris)
print(paste("cost : ", s$cost, sep = ""))
s = svm(Species ~ ., data = iris, cost = 0.01)
p = predict(s, iris)
table(p, iris$Species)
s = svm(Species ~ ., data = iris, cost = 200)
p = predict(s, iris)
table(p, iris$Species)
