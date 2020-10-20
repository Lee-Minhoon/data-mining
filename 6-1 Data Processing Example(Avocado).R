# Avocado Dataset
avocado = read.csv("./resource/avocado.csv", header = TRUE)
avocado

library(dplyr)
(x_avg = avocado %>% group_by(region) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))
(x_avg = avocado %>% group_by(region, year) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))
(x_avg = avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))

# arrange function (데이터 정렬)
arrange(x_avg, desc(V_avg))

x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg), ]

# Lubridate Library
install.packages("lubridate")
library(lubridate)

(x_avg = avocado %>% group_by(region, year, month(Date), type) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))

max(x_avg1$V_avg)
x_avg1$V_avg == max(x_avg1$V_avg)
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg), ]
x_avg[367, ]

# Assignment
x_avg = avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice))
x_avg
