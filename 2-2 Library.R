# ���̺귯�� ��ġ
install.packages("dplyr")
install.packages("ggplot2")

# ���̺귯�� ����
library(dplyr)
library(ggplot2)
search()

# ������ ���캸��
str(iris)
head(iris, 10)

plot(iris)
plot(iris$Petal.Width, iris$Petal.Length, col=iris$Species)

tips=read.csv('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv')
str(tips)
head(tips, 10)

# �Ӽ����� ��� ��� Ȯ��
summary(tips)

# ���̺귯�� Ȱ�� - Ž���� ������ �м�
tips%>%ggplot(aes(size))+geom_histogram()
tips%>%ggplot(aes(total_bill, tip))+geom_point()
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day))
tips%>%ggplot(aes(total_bill, tip))+geom_point(aes(col=day, pch=sex, size=3))