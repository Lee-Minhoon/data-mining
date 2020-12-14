install.packages("text2vec")
library(text2vec)
library(caret)

str(movie_review)
head(movie_review)

train_list = createDataPartition(y = movie_review$sentiment, p = 0.6, list = FALSE)
mtrain = movie_review[train_list, ]
mtest = movie_review[-train_list, ]

doc = Corpus(VectorSource(mtrain$review))

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removeWords, stopwords('english'))
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

dtm = DocumentTermMatrix(doc)
dim(dtm)

inspect(dtm)

dtm_small = removeSparseTerms(dtm, 0.90)
X = as.matrix(dtm_small)
dataTrain = as.data.frame(cbind(mtrain$sentiment, X))
dataTrain$V1 = as.factor(dataTrain$V1)
colnames(dataTrain)[1] = 'y'

library(rpart)
r = rpart(y ~ ., data = dataTrain)
printcp(r)

par(mfrow = c(1, 1), xpd = NA)
plot(r)
text(r, use.n = TRUE)

library(randomForest)
f = randomForest(y ~ ., data = dataTrain)

docTest = Corpus(VectorSource(mtest$review))

docTest = tm_map(docTest, content_transformer(tolower))
docTest = tm_map(docTest, removeNumbers)
docTest = tm_map(docTest, removeWords, stopwords('english'))
docTest = tm_map(docTest, removePunctuation)
docTest = tm_map(docTest, stripWhitespace)

dtmTest = DocumentTermMatrix(docTest,
                             control = list(dictionary = dtm_small$dimnames$Terms))

dim(dtmTest)
str(dtmTest)
inspect(dtmTest)

Y = as.matrix(dtmTest)
dataTest = as.data.frame(Y)
pr = predict(r, newdata = dataTest, type = 'class')
table(pr, mtest$sentiment)

pf = predict(f, newdata = dataTest)
table(pf, mtest$sentiment)

library(tm)
library(XML)
library(wordcloud2)
library(SnowballC)
library(RCurl)

t = readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d = htmlParse(t, asText = TRUE)
clean_doc = xpathSApply(d, "//p", xmlValue)

doc = Corpus(VectorSource(clean_doc))
inspect(doc)

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

dtm = DocumentTermMatrix(doc)
dim(dtm)
inspect(dtm)

m = as.matrix(dtm)
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
d1 = d[1:500, ]
wordcloud2(d1)

# Assignment
library(tm)
library(XML)
library(wordcloud2)
library(SnowballC)
library(RCurl)

t = readLines('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0')
d = htmlParse(t, asText = TRUE)
clean_doc = xpathSApply(d, "//p", xmlValue)

doc = Corpus(VectorSource(clean_doc))
inspect(doc)

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

dtm = DocumentTermMatrix(doc)
dim(dtm)
inspect(dtm)

m = as.matrix(dtm)
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
d1 = d[1:500, ]
wordcloud2(d1)
