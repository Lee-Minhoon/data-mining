# Electricity Dataset
resource_path = "./resource/"
elec_gen = read.csv(paste(resource_path, "electricity_generation_per_person.csv", sep=""), header = TRUE, sep=",")
names(elec_gen)[2:33] = substr(names(elec_gen[2:33]), 2, nchar(names(elec_gen[2:33])))
names(elec_gen)
head(elec_gen)

elec_use = read.csv(paste(resource_path, "electricity_use_per_person.csv", sep=""), header = TRUE, sep=",")
names(elec_use)[2:56] = substr(names(elec_use[2:56]), 2, nchar(names(elec_use[2:56])))
names(elec_use)
head(elec_use)

View(elec_gen)
View(elec_use)

# gather function
install.packages("tidyr")
library(tidyr)
elec_gen_new = gather(elec_gen, -country, key = "year", value = "ElecGen")
elec_use_new = gather(elec_use, -country, key = "year", value = "ElecUse")

View(elec_gen_new)
View(elec_use_new)

# merge (데이터 프레임 병합)
elec_gen_use = merge(elec_gen_new, elec_use_new)

View(elec_gen_use)

# Assignment
View(elec_gen_use)
