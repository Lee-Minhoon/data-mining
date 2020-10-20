# Á¶°Ç¹®
test = c(15, 20, 30, NA, 45)
test[test < 40]
test[test %% 3!=0]
test[is.na(test)]
test[!is.na(test)]
test[test %% 2==0 & !is.na(test)]

characters = data.frame(name = c("±æµ¿", "ÃáÇâ", "Ã¶¼ö"), age = c(30, 16, 21),
                        gender = factor(c("M", "F", "M")))
characters
characters[characters$gender == "F", ]
characters[characters$age < 30 & characters$gender == "M", ]

x = 5
if (x %% 2 == 0){
  print('x´Â Â¦¼ö')
} else {
  print('x´Â È¦¼ö')
}

x = 1
if (x > 0) {
  print('x is positive value.')
} else if (x < 0) {
  print('x is negative value.')
} else {
  print('x is zero.')
}

x = c(-5:5)
x
options(digits=3)
sqrt(x)
sqrt(ifelse(x >= 0, x, NA))

students = read.csv("./resource/students2.csv")
students
students[, 2] = ifelse(students[, 2] >= 0 & students[, 2] <= 100, students[, 2], NA)
students[, 3] = ifelse(students[, 3] >= 0 & students[, 3] <= 100, students[, 3], NA)
students[, 4] = ifelse(students[, 4] >= 0 & students[, 4] <= 100, students[, 4], NA)
students

# ¹İº¹¹®
i = 1
repeat {
  if (i > 10) {
    break
  } else {
    print(i)
    i = i + 1
  }
}

i = 1
while (i <= 10) {
  print(i)
  i = i + 1
}

i = 1
while (i < 10) {
  print(paste(2, "X", i, "=", 2 * i))
  i = i + 1
}

for (i in 1:10) {
  print(i)
}

for (i in 2:9) {
  for (j in 1:9)
    print(paste(i, "X", j, "=", i * j))
}

for (i in 1:10) {
  if (i %% 2 == 0) {
    print(i)
  }
}

students = read.csv("./resource/students2.csv")
students
for (i in 2:4) {
  students[, i] = ifelse(students[, i] >= 0 & students[, i] <= 100, students[, i], NA)
}
students

# Assignment
total = 0
for (i in c(1:10)) {
  if (i %% 2 == 0) total = total + i
}
total
