# Wine Dataset
resource_path = "./resource/"
wine = read.table(paste(resource_path, "wine.txt", sep=""), header = FALSE, sep=",")
head(wine)

col_name = readLines(paste(resource_path, "wine_name.txt", sep=""))
col_name

names(wine)[2:14] <- substr(col_name, 4, nchar(col_name))
names(wine)

head(wine)

# train set & test set
library(dplyr)
train_set = sample_frac(wine, 0.6)
str(train_set)

test_set = setdiff(wine, train_set)
str(test_set)

# Assignment
library(dplyr)
train_set = sample_frac(wine, 0.6)
str(train_set)

test_set = setdiff(wine, train_set)
str(test_set)
