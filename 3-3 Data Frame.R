# Data Frame
name = c("繹熱", "轔щ", "望翕")
age = c(27, 20, 25)
gender = factor(c("M", "F", "M"))
blood.type = factor(c("A", "O", "B"))

patients = data.frame(name, age, gender, blood.type)
patients

patients$name
patients[1, ]
patients[, 2]
patients[3, 1]
patients[patients$name == "繹熱", ]
patients[patients$name == "繹熱", c("name", "age")]

# Data Frame related Functions
head(cars)
speed
attach(cars)
speed
detach(cars)
speed

mean(cars$speed)
max(cars$speed)

with(cars, mean(speed))
with(cars, max(speed))

subset(cars, speed > 20)
subset(cars, speed > 20, select = c(dist))
subset(cars, speed > 20, select = -c(dist))

head(airquality)
head(na.omit(airquality))

patients1 = data.frame(name, age, gender)
patients1

patients2 = data.frame(name, blood.type)
patients2

patients3 = merge(patients1, patients2, by = "name")
patients3

name1 = c("繹熱", "轔щ", "望翕")
patients1 = data.frame(name1, age, gender)
name2 = c("團熱", "轔щ", "望翕")
patients2 = data.frame(name2, blood.type)
patients3 = merge(patients1, patients2, by.x = "name1", by.y = "name2")
patients3
patients3 = merge(patients1, patients2, by.x = "name1", by.y = "name2", all = TRUE)
patients3

# Assignment
mean(na.omit(airquality$Ozone))
