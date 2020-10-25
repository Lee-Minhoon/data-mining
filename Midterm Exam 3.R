# ���̺귯�� �ҷ�����
library(hflights)

#####################
##### problem A #####
#####################

# ������ ���� ���� �̸��� ���� �������ּ����� �������� �����ϴ�!
# ����ð�(AirTime), �Ÿ�(Distance) ��...

# NA�� �ƴ� �� �� ����ð��� ���� �� ���� ����´�.
longestTime = max(hflights$AirTime, na.rm = TRUE)
print(longestTime)

# ����ð��� �ð�, ������ �����Ѵ�.
air_hour = longestTime %/% 60
air_min = longestTime %% 60

# paste�Լ��� ����� ����ð��� ����Ѵ�.
print(paste(air_hour, "�ð� ", air_min, "��", sep = ""))

#####################
##### problem B #####
#####################

# NA�� �ƴ� �� �� ����Ÿ��� ���� �� ���� ����´�.
longestDistance = max(hflights$Distance, na.rm = TRUE)

# paste�Լ��� ����� ����Ÿ��� ����Ѵ�.
print(paste(longestDistance, "mile", sep = ""))

#####################
##### problem C #####
#####################

# �������� ��ҵ� �Ǽ��� �� �� ������ ����Ѵ�.
print(sum(hflights$Cancelled))