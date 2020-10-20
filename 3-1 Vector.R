# Vector
1:7
7:1
vector(length = 5)

# with c function
c(1:5)
c(1, 2, 3, c(4:6))
x = c(1, 2, 3)
x
y = c()
y = c(y, c(1:3))
y
x = c(x, y)
x

# with seq function
seq(from=1, to=10, by=2)
seq(1, 10, by=2)
seq(0, 1, by=0.1)
seq(0, 1, length.out=11)
seq(0, 1, length.out=14)

# with rep function
rep(c(1:3), times=2)
rep(c(1:3), each=2)

# Vector Operation
x = c(2, 4, 6, 8, 10)
length(x)
x[1]
x[1, 2, 3]
x[c(1, 2, 3)]
x[-c(1, 2, 3)]
x[c(1:3)]

x = c(1, 2, 3, 4)
y = c(5, 6, 7, 8)
z = c(3, 4)
w = c(5, 6, 7)

x + 2
x + y
x + z
x + w

x = 1:10
all(x > 5)
any(x > 5)

# head, tail function (default = 6)
head(x)
tail(x)
head(x, 3)
tail(x, 3)

# 집합 연산
x = c(1, 2, 3)
y = c(3, 4, 5)
z = c(3, 1, 2)

union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)
setequal(x, y)
setequal(x, z)

# Assignment
x = (5:14)
x[c(3, 5, 9)]
