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
f = randomForest(admit ~ ., data = ucla)
print(f)

# Call DataSet(Voice)
voice = read.csv("./resource/voice.csv")
str(voice)
table(is.na(voice))

# 강의 보고 입력하기
f = random..~
  
# Assignment