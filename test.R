a = "Machine learning is the study of computer algorithms that improve automatically through experience."
b = "Machine learning algorithms build a model based on sample data, known as \"training data\"."
df = data.frame(review = c(a, b))
df
doc = Corpus(VectorSource(df))

doc = tm_map(doc, content_transformer(tolower))

doc = tm_map(doc, removeNumbers)
doc = tm_map(doc, removeWords, stopwords('english'))
doc = tm_map(doc, removePunctuation)
doc = tm_map(doc, stripWhitespace)

dtm = DocumentTermMatrix(doc)
dtm$
doc <- tm_map(doc, stemDocument)
m = as.matrix(dtm)
m
v = sort(colSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
wordcloud2(d)
