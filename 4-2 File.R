# File I/O
students = read.csv("./resource/students.csv")
students
str(students)

students$name = as.character(students$name)
str(students)

students = read.csv("./resource/students.csv", stringsAsFactors = FALSE)
str(students)

studentsNA = read.csv("./resource/studentsNA.csv")
studentsNA
str(studentsNA)

write.csv(students, file = "./output/output.csv", quote = F)
write.csv(students, file = "./output/output_quote.csv", quote = T)

# Assignment
classes = read.csv("./resource/수업목록.csv", stringsAsFactors = FALSE)
classes
str(classes)
write.csv(classes, file = "./output/classes_out.csv", quote = F)
