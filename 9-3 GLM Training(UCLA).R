# Feature Selection
haberman = read.csv(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data",
  header = FALSE)
names(haberman) = c('age', 'op_year', 'no_nodes', 'survival')
str(haberman)

haberman$survival = factor(haberman$survival)
str(haberman)

h = glm(survival ~ age + no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h)

new_patients = data.frame(age = c(37, 66), op_year = c(58, 60), no_nodes = c(5, 32))
predict(h, newdata = new_patients, type = 'response')

# UCLA admission
ucla = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
str(ucla)

m = glm(admit~., data = ucla, family = binomial)
coef(m)
deviance(m)

summary(ucla)

s = data.frame(gre = c(376), gpa = c(3.6), rank = c(3))
predict(m, newdata = s, type = 'response')

# Assignment
ucla = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
str(ucla)

m = glm(admit~., data = ucla, family = binomial)
coef(m)
deviance(m)

summary(ucla)

for (i in c(1:4)) {
  s = data.frame(gre = c(376), gpa = c(3.6), rank = c(i))
  p = predict(m, newdata = s, type = 'response')
  print(paste("rank ", i, "의 예측값 : ", p, sep = ""))
}
