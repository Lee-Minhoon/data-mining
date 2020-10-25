# ���̺귯�� �ҷ�����
library(dplyr)

#####################
##### problem A #####
#####################

# airquality �������� Wind�� �ִ�ġ�� �����͸� �ҷ��´�.
# �� �� Month�� Day�� �ش��ϴ� ���� �ҷ��´�.
Windiest = airquality[airquality$Wind == max(airquality$Wind), c("Month", "Day")]
str(Windiest)

# Month�� Day�� ������ �����Ѵ�.
Month = Windiest["Month"]
Day = Windiest["Day"]

# �ٶ��� ���� ������ paste�Լ��� ����� ����Ѵ�.
print(paste("�ٶ��� ���� �� �� : ", Month, "�� ", Day, "��", sep = ""))

#####################
##### problem B #####
#####################

# ������ ������ ��� �������� ������ ����ϴ� ������
# �������� ���Ե� ���� ������ ����ϴ� ������ �� �𸣰ڽ��ϴ�!

# �� �������� ������ ����Ѵ�.
print(paste("�� ������ ����: ", sum(is.na(airquality)), sep = ""))

# �� �� �������� ������ ����Ѵ�.
for (i in names(airquality)) {
  print(paste(i, "���� ������ ���� : ", sum(is.na(airquality[i])), sep = ""))
}

# �������� ���Ե� ���� ������ ����Ѵ�.
print(paste("�������� ���Ե� ���� ���� : ", sum(!complete.cases(airquality)), sep = ""))