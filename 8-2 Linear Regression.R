# Linear Regression
x = c(3.0, 6.0, 9.0, 12.0)
y = c(3.0, 4.0, 5.5, 6.5)
m = lm(y ~ x)
m

# Ploting
plot(x, y)
abline(m, col = 'red')

coef(m) # 매개변수 값을 알려줌
fitted(m) # 훈련 집합에 있는 샘플에 대한 예측값
residuals(m) # 잔차를 알려줌
deviance(m)/length(x) # 잔차 제곱합을 평균 제곱 오차로 변환하여 출력

summary(m)

# Predict
newx = data.frame(x = c(1.2, 2.0, 20.65))
predict(m, newdata = newx)

# Cars Data
str(cars)
head(cars)
plot(cars)

car_model = lm(dist ~ speed, data = cars)
coef(car_model)
abline(car_model, col = 'red')

nx1 = data.frame(speed = c(21.5))
predict(car_model, nx1)

nx2 = data.frame(speed = c(25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0))
predict(car_model, nx2)

nx = data.frame(speed = c(21.5, 25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0))
plot(nx$speed, predict(car_model, nx), col = 'red', cex = 2, pch = 20)
abline(car_model)

# Assignment
# 모델링
x = c(10.0, 12.0, 9.5, 22.2, 8.0)
y = c(360.2, 420.0, 359.5, 679.0, 315.3)
m = lm(y ~ x)
m

# plot
plot(x, y)
abline(m, col = 'red')

# 잔차 제곱합과 평균 제곱 오차
deviance(m)
deviance(m)/length(x)

# 새로운 샘플의 결과 예측
newx = data.frame(x = c(10.5, 25.0, 15.0))
predict(m, newdata = newx)
