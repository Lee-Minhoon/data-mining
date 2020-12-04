# Call DataSet(UCLA admission)
ucla = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
str(ucla)
ucla$admit = factor(ucla$admit)

# Decision Tree
library(rpart)
r = rpart(admit ~ ., data = ucla)
par(mfcol = c(1, 1), xpd = NA)
plot(r)
text(r, use.n = TRUE)

p = predict(r, ucla, type = 'class')
table(p, ucla$admit)

# Random Forest
library(randomForest)
f = randomForest(admit ~ ., data = ucla)
print(f)

# Call DataSet(Voice)
# default.stringsAsFactors() -> False???
voice = read.csv("./resource/voice.csv", stringsAsFactors = TRUE)
str(voice)
table(is.na(voice))

r = rpart(label ~ ., data = voice)
par(mfrow = c(1, 1), xpd = NA)
plot(r)
text(r, use.n = TRUE)

p = predict(r, voice, type = 'class')
table(p, voice$label)

f = randomForest(label ~ ., data = voice)
f
treesize(f)
  
# Assignment
s = svm(admit ~ ., data = ucla)
p = predict(s, ucla, type = 'class')
table(p, ucla$admit)
print(paste("Accuracy of SVM : ", sum(ucla$admit == p) / NROW(p) * 100, "%", sep = ""))

r = rpart(admit ~ ., data = ucla)
p = predict(r, ucla, type = 'class')
table(p, ucla$admit)
sum(ucla$admit == p) / NROW(p)
print(paste("Accuracy of Decision Tree : ", sum(ucla$admit == p) / NROW(p) * 100, "%", sep = ""))

f = randomForest(admit ~., data = ucla)
p = predict(r, ucla, type = 'class')
table(p, ucla$admit)
sum(ucla$admit == p) / NROW(p)
print(paste("Accuracy of Random Forest : ", sum(ucla$admit == p) / NROW(p) * 100, "%", sep = ""))
