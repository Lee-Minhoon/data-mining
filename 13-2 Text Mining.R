library(RCurl)
library(XML)

t = readLines('https://en.wikipedia.org/wiki/Data_science')
d = htmlParse(t, asText = TRUE)
clean_doc = xpathSApply(d, "//p", xmlValue)

install.packages("tm")
install.packages("SnowballC")
library(tm)
library(SnowballC)

doc = Corpus(VectorSource(clean_doc))

doc = tm_map(doc, content_transformer(tolower))
doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removeWords, stopwords('english'))
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

dtm = DocumentTermMatrix(doc)
dim(dtm)

inspect(dtm)

library(wordcloud)

m = as.matrix(dtm)
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words = 100, random.order = FALSE, rot.per = 0.35)

install.packages("wordcloud2")
library(wordcloud2)

wordcloud2(d)
d1 = d[1:200, ]
wordcloud2(d1, shape = 'star')
wordcloud2(d1, minRotation = pi/4, maxRotation = pi/4,
           rotateRatio = 1.0)

library(gapminder)
library(dplyr)
pop_data = gapminder%>%filter(year==2007)%>%group_by(continent)%>%summarize(sum(pop))
d = data.frame(word = pop_data[, 1], freq = pop_data[, 2])
wordcloud(words = d[, 1], freq = d[, 2], min.freq = 1, max.words = 6,
          random.color = FALSE, rot.per = 0.35)
wordcloud2(d)

# Assignment
library(gapminder)
library(dplyr)
pop_data = gapminder%>%filter(year==2007)%>%group_by(continent)%>%summarize(sum(pop))
d = data.frame(word = pop_data[, 1], freq = pop_data[, 2])
wordcloud(words = d[, 1], freq = d[, 2], min.freq = 1, max.words = 6,
          random.color = FALSE, rot.per = 0.35)
wordcloud2(d)
