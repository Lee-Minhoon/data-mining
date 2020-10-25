# ���̺귯�� �ҷ�����
library(dplyr)
library(tidyr)

# �����ͼ� �ҷ����� & ���� Ȯ���ϱ�
# �����ͼ��� kaggle���� covid19���� �����ͼ��� �ٿ�޾ҽ��ϴ�.
covid19 = read.csv("./resource/covid19/covid_19_clean_complete.csv", header = TRUE)
str(covid19)
covid19

# �ɼ�2. ������ ���� (����� NA�� ǥ�õ��� �ʾ� NA�� �ٲپ��ְ� na.omit�� ���� �����Ѵ�.)
# �������� �����ϰ����� ���� 8����ۿ� �����ʾ� �������� ���� ����ü�� �����Ͽ����ϴ�.
# covid19[covid19 == ""] = NA
# sum(is.na(covid19))
# covid19 = na.omit(covid19)
# sum(is.na(covid19))
# str(covid19)
covid19 = covid19[, c(2:10)]

# �ɼ�7. ������ �������� �������� ����, ��¥�� �������� �������� �����Ѵ�.
# �ɼ�6. %>% �����ڸ� ����Ѵ�.
covid19 = covid19 %>% arrange(Country.Region, desc(Date))
str(covid19)

# �ɼ�8. ��¥ �� ��踦 ����.
date_status = covid19 %>% group_by(Date) %>% summarize(
  confirmed_avg = mean(Confirmed),
  deaths_avg = mean(Deaths),
  recovered_avg = mean(Recovered),
  active_avg = mean(Active)
)
date_status = date_status %>% arrange(desc(Date))
date_status

# �ɼ�5. �׷� ���� ��踦 ����.(���� ��)
country_status = covid19 %>% group_by(Country.Region) %>% summarize(
  total_confirmed = sum(Confirmed),
  total_deaths = sum(Deaths),
  total_recovered = sum(Recovered),
  total_active = sum(Active)
  )
country_status

# �ɼ�4. �� ���� ��踦 ����.
# �ɼ�10. �� ���� ��谡 ��� ���͸� ������ ���������� �籸���ϰ� ������ ���� ���� �߰��Ѵ�.
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

# �ɼ�11. ������ ������ ����(total_status, avg_status�� country_status�� ����)
# �ɼ�4. �� ���� ��踦 ���� �� Ȯ���ڰ� �󸶳� ������ ������ �����, ȸ������ �˾ƺ��� ���� �߰��Ѵ�.
country_status = rbind(total_status, avg_status, country_status)
country_status["confirmed_rank"] = rank(country_status$total_confirmed)
country_status["death_rate"] = paste(round(country_status$total_deaths/country_status$total_confirmed*100, 2), "%", sep = "")
country_status["recovery_rate"] = paste(round(country_status$total_recovered/country_status$total_confirmed*100, 2), "%", sep = "")
country_status

# �ɼ�10. gather�� spread����ؼ� ������, ���������� ������ �������� �籸�� �غ��� � ���� �������� üũ�غ���.
gather_data = gather(country_status, key = 'key', value = 'value', total_confirmed:recovery_rate)
gather_data
spread(gather_data, key, value)

# �ɼ�9. Ʈ���̴׼�/�׽�Ʈ���� �ѹ� ������.
train_set = sample_frac(country_status, 0.9)
str(train_set)

test_set = setdiff(country_status, train_set)
str(test_set)

# ���� �����͸� Ȯ���غ���.
View(country_status)