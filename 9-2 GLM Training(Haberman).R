# Generalized Linear Model
# Train Model
muffler = data.frame(discount = c(2.0, 4.0, 6.0, 8.0, 10.0), profit = c(0, 0, 0, 1, 1))
g = glm(profit ~ discount, data = muffler, family = binomial)

coef(g)
fitted(g)
residuals(g)
deviance(g)

plot(muffler, pch = 20, cex = 2)
abline(g, col = 'blue', lwd = 2)

# New Data
newd = data.frame(discount = c(1, 5, 12, 20, 30))
p = predict(g, newd, type = 'response')
print(p)

plot(muffler, pch = 20, cex = 2, xlim = c(0, 32))
abline(g, col = 'blue', lwd = 2)
res = data.frame(discount = newd, profit = p)
points(res, pch = 20, cex = 2, col = 'red')
legend("bottomright", legend = c("train data", "new data"), pch = c(20, 20),
       cex = 2, col = c("black", "red"), bg = "gray")

# Haberman Survival
haberman = read.csv(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data",
  header = FALSE)
names(haberman) = c('age', 'op_year', 'no_nodes', 'survival')
str(haberman)

haberman$survival = factor(haberman$survival)
str(haberman)

h = glm(survival ~ age + op_year + no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h)

new_patients = data.frame(age = c(37, 66), op_year = c(58, 60), no_nodes = c(5, 32))
predict(h, newdata = new_patients, type = 'response')

# Assignment
haberman = read.csv(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data",
  header = FALSE)
names(haberman) = c('age', 'op_year', 'no_nodes', 'survival')
str(haberman)

haberman$survival = factor(haberman$survival)
str(haberman)

h = glm(survival ~ age + op_year + no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h)

new_patients = data.frame(age = c(37, 66), op_year = c(58, 60), no_nodes = c(5, 32))
predict(h, newdata = new_patients, type = 'response')
