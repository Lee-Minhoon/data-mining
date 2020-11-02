matplot(iris[, 1:4], type = "l")
legend("topleft", names(iris)[1:4], lty = c(1, 2, 3, 4), col = c(1, 2, 3, 4))

hist(cars$speed)

library(gapminder)
library(ggplot2)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) +
  geom_point(alpha = 0.2)

# aes : 플롯의 가로축 / 세로축 대응 데이터 지정하는 함수
gapminder %>% filter(lifeExp > 70) %>% group_by(continent) %>%
  summarize(n = n_distinct(country)) %>% ggplot(aes(x = continent, y = n)) +
  geom_bar(stat = "identity")

# geom_point : 데이터를 점으로 표시하는 플롯
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) +
  geom_point(alpha = 0.2)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) +
  geom_point(alpha = 0.7)

# geom_bar : 데이터를 막대그래프로 표시하는 플롯
gapminder %>% filter(lifeExp > 70) %>% group_by(continent) %>%
  summarize(n = n_distinct(country)) %>% ggplot(aes(x = continent, y = n)) +
  geom_bar(stat = "identity")

# geom_histogram
gapminder %>% filter(year == 2007) %>% ggplot(aes(lifeExp, col = continent)) +
  geom_histogram()

gapminder %>% filter(year == 2007) %>% ggplot(aes(lifeExp, col = continent)) +
  geom_histogram(position = "dodge")

# scale_x_log10(), scale_y_log10()
# 데이터에 직접 로그를 취하지 않고도 축의 스케일을 바꾸어 동일한 효과를 얻을 수 있음
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) +
  geom_point(alpha = 0.2)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col = continent)) +
  geom_point(alpha = 0.2) + scale_x_log10()

# coord_flip : 플롯의 방향을 전환
gapminder %>% filter(continent == "Africa") %>% ggplot(aes(country, lifeExp)) +
  geom_bar(stat = "identity")

gapminder %>% filter(continent == "Africa") %>% ggplot(aes(country, lifeExp)) +
  geom_bar(stat = "identity") + coord_flip()

# Assignment
cars
ggplot(cars, aes(x = speed, y = dist)) +
  geom_point(alpha = 1.0) +
  ggtitle("cars") +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 20, color = "#5D5D5D")) +
