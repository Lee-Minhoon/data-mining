# Matrix
x = array(1:5, c(2, 4))
x
x[1, ]
x[, 2]

x = 1:12
matrix(x, nrow = 3)
matrix(x, nrow = 3, byrow = T)

# cbind, rbind function
v1 = c(1, 2, 3, 4)
v2 = c(5, 6, 7, 8)
v3 = c(9, 10, 11, 12)

cbind(v1, v2, v3)
rbind(v1, v2, v3)

# Matrix Operation
x = array(1:4, dim = c(2, 2))
x
y = array(5:8, dim = c(2, 2))
y

x + y
x * y
x %*% y # 수학적인 행렬 곱셈
t(x) # transpose
solve(x) # 역행렬
det(x) # 행렬식

# apply, dim, sample function
x = array(1:12, c(3, 4))
apply(x, 1, mean)
apply(x, 2, mean)
dim(x)

sample(x)
sample(x, 10)
sample(10)
