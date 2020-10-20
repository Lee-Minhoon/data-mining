# Function
fact = function(x) {
  fa = 1
  while(x > 1) {
    fa = fa * x
    x = x - 1
  }
  return (fa)
}
fact(5)

# 衣著葵 坦軒
str(airquality)
head(is.na(airquality))
table(is.na(airquality))
table(is.na(airquality$Temp))
table(is.na(airquality$Ozone))
mean(airquality$Temp)
mean(airquality$Ozone)

air_narm = airquality[!is.na(airquality$Ozone), ]
air_narm
mean(air_narm$Ozone)

air_narm1 = na.omit(airquality)
mean(air_narm1$Ozone)

mean(airquality$Ozone, na.rm = T)

table(is.na(airquality))
table(is.na(airquality$Ozone))
table(is.na(airquality$Solar.R))
air_narm = airquality[!is.na(airquality$Ozone) & !is.na(airquality$Solar.R), ]
mean(air_narm$Ozone)

name = c("発切1", "発切2", "発切3", "発切4", "発切5")
age = c(22, 20, 25, 30, 27)
gender = factor(c("M", "F", "M", "K", "F"))
blood.type = factor(c("A", "O", "B", "AB", "C"))
patients = data.frame(name = name, age = age, gender = gender, blood.type = blood.type)
patients
patients_outrm = patients[patients$gender == "M" | patients$gender == "F", ]
patients_outrm
patients_outrm1 = patients[
  (patients$gender == "M" | patients$gender == "F")
  & (patients$blood.type == "A" | patients$blood.type == "B"
     |patients$blood.type == "O" | patients$blood.type == "AB"),
  ]
patients_outrm1

# Assignment
name = c("発切1", "発切2", "発切3", "発切4", "発切5")
age = c(22, 20, 25, 30, 27)
gender = factor(c("M", "F", "M", "K", "F"))
blood.type = factor(c("A", "O", "B", "AB", "C"))
patients = data.frame(name = name, age = age, gender = gender, blood.type = blood.type)
patients_outrm1 = patients[
  (patients$gender == "M" | patients$gender == "F")
  & (patients$blood.type == "A" | patients$blood.type == "B"
     |patients$blood.type == "O" | patients$blood.type == "AB"),
]
patients_outrm1
