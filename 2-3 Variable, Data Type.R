# Variable
x = 1
y = 2
z = x + y
z

x + y = z
z <- x + y
z

x = x + 3
y = y * 3
x + y -> z
z

# 범주형
blood.type = factor(c('A', 'B', 'O', 'AB'))
blood.type

# 특수 상수
xinf = Inf
yinf = -Inf
xinf/yinf

# 데이터형 확인, 변환
is.integer(x)
is.numeric(x)
x = as.integer(x)
is.integer(x)

xl = 3L
is.integer(xl)

# 연산자
1 < x & x < 5