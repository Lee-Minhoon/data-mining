# 라이브러리 불러오기
library(hflights)

#####################
##### problem A #####
#####################

# 교수님 실제 열의 이름도 같이 기재해주셨으면 좋았을것 같습니다!
# 비행시간(AirTime), 거리(Distance) 등...

# NA가 아닌 값 중 비행시간이 가장 긴 값을 들고온다.
longestTime = max(hflights$AirTime, na.rm = TRUE)
print(longestTime)

# 비행시간을 시간, 분으로 구분한다.
air_hour = longestTime %/% 60
air_min = longestTime %% 60

# paste함수를 사용해 비행시간을 출력한다.
print(paste(air_hour, "시간 ", air_min, "분", sep = ""))

#####################
##### problem B #####
#####################

# NA가 아닌 값 중 비행거리가 가장 긴 값을 들고온다.
longestDistance = max(hflights$Distance, na.rm = TRUE)

# paste함수를 사용해 비행거리를 출력한다.
print(paste(longestDistance, "mile", sep = ""))

#####################
##### problem C #####
#####################

# 비행편이 취소된 건수가 총 몇 건인지 출력한다.
print(sum(hflights$Cancelled))
