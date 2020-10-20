name = c("発切1", "発切2", "発切3", "発切4", "発切5")
age = c(22, 20, 25, 30, 27)
gender = c(1, 2, 1, 3, 2)
blood.type = c(1, 3, 2, 4, 5)
patients = data.frame(name = name, age = age, gender = gender, blood.type = blood.type)
patients
patients$gender = ifelse((patients$gender < 1 | patients$gender > 2), NA, patients$gender)
patients
patients$blood.type = ifelse((patients$blood.type < 1 | patients$blood.type > 4), NA, patients$blood.type)
patients
patients[!is.na(patients$gender) & !is.na(patients$blood.type), ]

install.packages("gapminder")
library(gapminder)
glimpse(gapminder)
gapminder[, c("country", "lifeExp")]
gapminder[, c("country", "lifeExp", "year")]
gapminder[gapminder$country == "Croatia", ]
gapminder[gapminder$country == "Croatia", "pop"]
gapminder[gapminder$country == "Croatia", c("lifeExp", "pop")]

gapminder[gapminder$country == "Croatia" & gapminder$year > 1990, c("lifeExp", "pop")]

# Assignment
install.packages("gapminder")
library(gapminder)
gapminder[gapminder$country == "Korea, Rep.", c("country", "lifeExp", "pop")]
