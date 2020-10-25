# 라이브러리 불러오기
library(dplyr)
library(tidyr)

# 데이터셋 불러오기 & 구조 확인하기
# 데이터셋은 kaggle에서 covid19관련 데이터셋을 다운받았습니다.
covid19 = read.csv("./resource/covid19/covid_19_clean_complete.csv", header = TRUE)
str(covid19)
covid19

# 옵션2. 결측값 제거 (빈곳이 NA로 표시되지 않아 NA로 바꾸어주고 na.omit을 통해 제거한다.)
# 결측값을 제거하고나니 나라가 8나라밖에 남지않아 결측값이 많은 열자체를 제거하였습니다.
# covid19[covid19 == ""] = NA
# sum(is.na(covid19))
# covid19 = na.omit(covid19)
# sum(is.na(covid19))
# str(covid19)
covid19 = covid19[, c(2:10)]

# 옵션7. 국가를 기준으로 오름차순 정렬, 날짜를 기준으로 내림차순 정렬한다.
# 옵션6. %>% 연산자를 사용한다.
covid19 = covid19 %>% arrange(Country.Region, desc(Date))
str(covid19)

# 옵션8. 날짜 별 통계를 낸다.
date_status = covid19 %>% group_by(Date) %>% summarize(
  confirmed_avg = mean(Confirmed),
  deaths_avg = mean(Deaths),
  recovered_avg = mean(Recovered),
  active_avg = mean(Active)
)
date_status = date_status %>% arrange(desc(Date))
date_status

# 옵션5. 그룹 단위 통계를 낸다.(국가 별)
country_status = covid19 %>% group_by(Country.Region) %>% summarize(
  total_confirmed = sum(Confirmed),
  total_deaths = sum(Deaths),
  total_recovered = sum(Recovered),
  total_active = sum(Active)
  )
country_status

# 옵션4. 열 단위 통계를 낸다.
# 옵션10. 열 단위 통계가 담긴 벡터를 데이터 프레임으로 재구성하고 병합을 위해 열을 추가한다.
sum_list = c("total_confirmed", "total_deaths", "total_recovered", "total_active")
cname = data.frame(Country.Region = "Total")
cname
total_status = apply(country_status[, sum_list], 2, sum)
total_status = as.data.frame(rbind(total_status))
total_status = cbind(cname, total_status)
total_status

cname = data.frame(Country.Region = "Average")
cname
avg_status = apply(country_status[, sum_list], 2, mean)
avg_status = as.data.frame(rbind(avg_status))
avg_status = cbind(cname, avg_status)
avg_status

# 옵션11. 데이터 프레임 병합(total_status, avg_status를 country_status에 병합)
# 옵션4. 행 마다 통계를 내어 총 확진자가 얼마나 적은지 순위와 사망률, 회복률을 알아보기 쉽게 추가한다.
country_status = rbind(total_status, avg_status, country_status)
country_status["confirmed_rank"] = rank(country_status$total_confirmed)
country_status["death_rate"] = paste(round(country_status$total_deaths/country_status$total_confirmed*100, 2), "%", sep = "")
country_status["recovery_rate"] = paste(round(country_status$total_recovered/country_status$total_confirmed*100, 2), "%", sep = "")
country_status

# 옵션10. gather와 spread사용해서 가로형, 세로형으로 데이터 프레임을 재구성 해보고 어떤 것이 유용한지 체크해본다.
gather_data = gather(country_status, key = 'key', value = 'value', total_confirmed:recovery_rate)
gather_data
spread(gather_data, key, value)

# 옵션9. 트레이닝셋/테스트셋을 한번 만들어본다.
train_set = sample_frac(country_status, 0.9)
str(train_set)

test_set = setdiff(country_status, train_set)
str(test_set)

# 최종 데이터를 확인해본다.
View(country_status)
