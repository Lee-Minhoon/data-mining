# Dplyr Library
library(dplyr)
library(gapminder)
search()

select(gapminder, country, year, lifeExp)
filter(gapminder, country == "Croatia")

summarize(gapminder, pop_avg = mean(pop))
summarize(group_by(gapminder, continent), pop_avg = mean(pop))
summarize(group_by(gapminder, continent, country), pop_avg = mean(pop))
gapminder %>% group_by(continent, country) %>% summarize(pop_avg = mean(pop))

temp1 = filter(gapminder, country == "Croatia")
temp2 = select(temp1, country, year, lifeExp)
temp3 = apply(temp2[, c("lifeExp")], 2, mean)
temp3

gapminder %>% filter(country == "Croatia") %>% select(country, year, lifeExp) %>% summarize(lifeExp_avg = mean(lifeExp))

# Assignment
library(dplyr)
library(gapminder)
gf = gapminder %>% filter(country == "Korea, Rep.")
gs = gf %>% select(country, lifeExp, pop)
gs
