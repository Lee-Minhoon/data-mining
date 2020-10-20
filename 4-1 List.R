# List
name = c("Ã¶¼ö", "ÃáÇâ", "±æµ¿")
age = c(27, 20, 25)
gender = factor(c("M", "F", "M"))
blood.type = factor(c("A", "O", "B"))

patients = data.frame(name, age, gender, blood.type)
patients
no.patients = data.frame(day = c(1:6), no = c(50, 60, 55, 52, 65, 58))

listPatients = list(patients, no.patients)
listPatients
listPatients = list(patients=patients, no.patients=no.patients)
listPatients

listPatients$patients
listPatients[[1]]
listPatients[["patients"]]

lapply(listPatients$no.patients, mean)
lapply(listPatients$patients, mean)
sapply(listPatients$no.patients, mean)
sapply(listPatients$no.patients, mean, simplify = F)

remaining_room = 30
listPatients$room = remaining_room
listPatients
listPatients$room = NULL
listPatients

# Assignment
room = data.frame(floor = c(1, 4, 5), room.no = c (102, 403, 501))
room

listPatients$room = room
listPatients
