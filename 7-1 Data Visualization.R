anscombe

# 평균
apply(anscombe, 2, mean)

# 분산
apply(anscombe, 2, var)

# 상관관계(상관계수)
cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)

library(gapminder)
library(dplyr)
y <- gapminder %>% group_by(year, continent) %>% summarize(c_pop = sum(pop))
head(y, 20)

plot(y$year, y$c_pop)
plot(y$year, y$c_pop, col = y$continent)
plot(y$year, y$c_pop, col = y$continent, pch = c(1:5))
plot(y$year, y$c_pop, col = y$continent, pch = c(5:1))
plot(y$year, y$c_pop, col = y$continent, pch = c(2, 4, 5, 8, 10))
legend("topleft", legend = levels(y$continent), col = y$continent, pch = c(1:5))
legend("bottomright", legend = levels(y$continent), col = y$continent, pch = c(2, 4, 5, 8, 10))
legend("right", legend = levels(y$continent), col = y$continent, pch = c(2, 4, 5, 8, 10))

# Assignment
library(gapminder)
library(dplyr)

y <- gapminder %>% group_by(year, continent) %>% summarize(c_pop = sum(pop))
plot(y$year, y$c_pop, col = y$continent, pch = c(1:5))
legend("topleft", legend = levels(y$continent), col = y$continent, pch = c(1:5))
