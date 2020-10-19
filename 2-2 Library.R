# 라이브러리 설치
install.packages("dplyr")
install.packages("ggplot2")

# 라이브러리 부착
library(dplyr)
library(ggplot2)
search()

# 데이터 살펴보기
str(iris)
head(iris, 10)

plot(iris)
plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species)

tips=read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
str(tips)
head(tips, 10)

# 속성별로 요약 통계 확인
summary(tips)

# 라이브러리 활용 - 탐색적 데이터 분석
tips%>%ggplot(aes(size))+geom_histogram()
tips%>%ggplot(aes(total_bill, tip))+geom_point()
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day))
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day, pch=sex, size=3))
