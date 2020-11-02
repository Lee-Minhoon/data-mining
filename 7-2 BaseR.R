head(cars)
plot(cars)
plot(cars$dist, cars$speed)
plot(cars)
plot(cars, type ="p")
plot(cars, type ="p", main = "cars")
plot(cars, type ="l", main = "cars")
plot(cars, type ="b", main = "cars")
plot(cars, type ="h", main = "cars")

library(gapminder)
x = gapminder %>% filter(year == 1952 & continent == 'Asia') %>%
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>%
  arrange(desc(gdp)) %>% head()
pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)

x = gapminder %>% filter(year == 2007 & continent == 'Asia') %>%
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>%
  arrange(desc(gdp)) %>% head()
pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)

x = gapminder %>% filter(year == 2007 & continent == 'Asia') %>%
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>%
  arrange(desc(gdp)) %>% head(10)
pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)

x = gapminder %>% filter(year == 2007 & continent == 'Asia') %>%
  mutate(gdp = gdpPercap*pop) %>% select(country, gdp) %>%
  arrange(gdp) %>% head(10)
pie(x$gdp, x$country)
barplot(x$gdp, names.arg = x$country)

# Assignment
plot(cars, type ="p", main = "cars")
plot(cars, type ="l", main = "cars")
plot(cars, type ="b", main = "cars")
plot(cars, type ="h", main = "cars")
