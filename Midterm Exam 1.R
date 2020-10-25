# 라이브러리 불러오기
library(dplyr)

#####################
##### problem A #####
#####################

# airquality 데이터중 Wind가 최대치인 데이터를 불러온다.
# 그 중 Month와 Day에 해당하는 열을 불러온다.
Windiest = airquality[airquality$Wind == max(airquality$Wind), c("Month", "Day")]
str(Windiest)

# Month와 Day를 변수에 저장한다.
Month = Windiest["Month"]
Day = Windiest["Day"]

# 바람이 가장 센날을 paste함수를 사용해 출력한다.
print(paste("바람이 가장 센 날 : ", Month, "월 ", Day, "일", sep = ""))

#####################
##### problem B #####
#####################

# 교수님 문제가 모든 결측값의 개수를 출력하는 것인지
# 결측값의 포함된 행의 개수를 출력하는 것인지 잘 모르겠습니다!

# 총 결측값의 개수를 출력한다.
print(paste("총 결측값 개수: ", sum(is.na(airquality)), sep = ""))

# 열 별 결측값의 개수를 출력한다.
for (i in names(airquality)) {
  print(paste(i, "행의 결측값 개수 : ", sum(is.na(airquality[i])), sep = ""))
}

# 결측값이 포함된 행의 개수를 출력한다.
print(paste("결측값이 포함된 행의 개수 : ", sum(!complete.cases(airquality)), sep = ""))
