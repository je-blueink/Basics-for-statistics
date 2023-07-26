par(mfrow=c(2,2)) # 여러개의 그래프를 그린 다음 2행 2열, 가로 방향을 기준으로 보여준다 
set.seed(8052) # 난수 생성을 고정하기 위한 seed값을 8052로 지정한다

dice10 = sample(1:6, 10, replace = TRUE)
# 주사위 10회 던지기의 시뮬레이션 결과
# 1부터 6까지 숫자 중 10개를 무작위로 중복을 허락해서 추출하고, 벡터 dice10에 넣는다. 
barplot(table(dice10)/10, ylim=c(0,0.3), main="(a) n=10")
# dice10에 들어간 각 숫자가 나온 횟수를 10회로 나눈 값, 
# 즉 10회 던졌을 때 각 숫자가 나올 확률을 y값으로 막대그래프를 그린다.
abline(b=0, a=1/6, col=2)
# y값 1/6 위치에 직선을 그어 보여준다

dice120 = sample(1:6, 120, replace = TRUE)
# 주사위 120회 던지기의 시뮬레이션 결과
# 1부터 6까지 숫자 중 120개를 무작위로 중복을 허락해서 추출하고, 벡터 dice120에 넣는다.
barplot(table(dice120)/120, ylim=c(0,0.3), main="(b) n=120")
abline(b=0, a=1/6, col=2)
# dice120에 들어간 각 숫자가 나온 횟수를 120회로 나눈 값, 
# 즉 120회 던졌을 때 각 숫자가 나올 확률을 y값으로 막대그래프를 그린다.
# y값 1/6 위치에 직선을 그어 보여준다

dice1200 = sample(1:6, 1200, replace = TRUE)
# 주사위 1200회 던지기의 시뮬레이션 결과
# 1부터 6까지 숫자 중 1200개를 무작위로 중복을 허락해서 추출하고, 벡터 dice1200에 넣는다.
barplot(table(dice1200)/1200, ylim=c(0,0.5), main="(c) n=1,200")
abline(b=0, a=1/6, col=2)
# dice1200에 들어간 각 숫자가 나온 횟수를 1200회로 나눈 값, 
# 즉 1200회 던졌을 때 각 숫자가 나올 확률을 y값으로 막대그래프를 그린다.
# y값 1/6 위치에 직선을 그어 보여준다

dice12000 = sample(1:6, 12000, replace = TRUE)
# 주사위 12000회 던지기의 시뮬레이션 결과
# 1부터 6까지 숫자 중 12000개를 무작위로 중복을 허락해서 추출하고, 벡터 dice12000에 넣는다.
barplot(table(dice12000)/12000, ylim=c(0,0.5), main="(d) n=12,000")
abline(b=0, a=1/6, col=2)
# dice12000에 들어간 각 숫자가 나온 횟수를 12000회로 나눈 값, 
# 즉 12000회 던졌을 때 각 숫자가 나올 확률을 y값으로 막대그래프를 그린다.
# y값 1/6 위치에 직선을 그어 보여준다

par(mfrow=c(2,2))
set.seed(8052)

dice10 = sample(1:6, 10, replace = TRUE) 
barplot(table(dice10)/10, ylim=c(0,0.3), main="(a) n=10")
abline(b=0, a=1/6, col=2)

dice120 = sample(1:6, 120, replace = TRUE)
barplot(table(dice120)/120, ylim=c(0,0.3), main="(b) n=120")
abline(b=0, a=1/6, col=2)

dice1200 = sample(1:6, 1200, replace = TRUE)
barplot(table(dice1200)/1200, ylim=c(0,0.5), main="(c) n=1,200")
abline(b=0, a=1/6, col=2)

dice12000 = sample(1:6, 12000, replace = TRUE)
barplot(table(dice12000)/12000, ylim=c(0,0.5), main="(d) n=12,000")
abline(b=0, a=1/6, col=2)