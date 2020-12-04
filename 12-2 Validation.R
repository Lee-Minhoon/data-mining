library(rpart)
library(randomForest)
n = nrow(iris)
i = 1:n
train_list = sample(i, n * 0.6)
test_list = setdiff(i, train_list)
iris_train = iris[train_list, ]
iris_test = iris[test_list, ]

f = randomForest(Species ~ ., data = iris_train)
p = predict(f, newdata = iris_test)
p

iris_test$Species

library(caret)
train_list = createDataPartition(y = iris$Species, p = 0.6, list = FALSE)
iris_train = iris[train_list, ]
iris_test = iris[-train_list, ]
f = randomForest(Species ~ ., data = iris_train)
p = predict(f, newdata = iris_test)
p

control = trainControl(method = 'cv', number = 5)
f = train(Species ~ ., data = iris, method = 'rf',
          metric = 'Accuracy', trControl = control)
confusionMatrix(f)

# Assignment
control = trainControl(method = 'cv', number = 5)
f = train(Species ~ ., data = iris, method = 'rf',
          metric = 'Accuracy', trControl = control)
confusionMatrix(f)
