# 7강에서 배우는 함수

# 수치적 함수
# pi; sin(); cos(); tan(); asin(); acos(); atan()
# 원주율; 삼각함수; 역삼각함수
# log(); log10(); exp(); sqrt()
# 자연로그 함수; 상용로그 함수; 지수로그 함수; 루트 함수
# min(); pmin(); max(); pmax(); range()
# 최솟값; 최솟값(벡터); 최댓값; 최댓값(벡터); 벡터의 범위(최솟값, 최댓값)

# 통계함수
# mean(); sd(); var(); median(); quantile(); cor()
# 평균; 표준편차; 분산; 중앙값; 백분위수; 상관계수

# 조건문
# if(조건) {실행문}
# if(조건) {실행문} else {실행문}
# if(조건) {if(조건) 실행문} else {실행문} #중첩조건문
# ifelse(조건, 실행문, ifelse(참이 아닐 때, 실행문))
# switch (object, case1 = action1, case2 = action2, ...)

# 반복문
# for (variable in vector) {실행문}
# while (condition) {실행문}
# 시작점; repeat {if(조건)break 실행문}

# 분기문 - 반복문 안에 들어간다
# if(조건)break 조건이 참일 때 실행문 수행 (조건 기준 앞부분만 수행)
# if(조건)next 조건이 참일 때 실행문 무시 (조건 기준 뒷부분만 수행)

시작점; for (variable in vector) {
  if(조건)break #중첩반복문의 분기문
  for (variable in vector) {
    if(조건)break #조건이 참일 때 이어지는 실행문 수행
    실행문}} 

시작점; while (condition) {
  실행문
  if(조건)next #조건이 참일 때 이어지는 실행문 무시
  실행문}

# -----7강 실습 시작-----

# if(){} 조건문: 예제 4-5
x <- c(1,2,3,4)
y <- c(2,1,4,5)
if(sum(x) < sum(y)) print(x)


# if(){} else{} 조건문: 예제 4-6
if(mean(x)<mean(y))
  print("mean(x)>mean(y)") else
    print("mean(x)<mean(y)")

if(mean(x)>mean(y)){
  print(mean(x))
  print(var(x))
} else {
  print(mean(y))
  print(var(y))
}


# ifelse() 조건문: 예제 4-8
ifelse(x<y,x,y)

ifelse(sum(x-y)>0,"positive",ifelse
       (sum(x-y)<0,"negative","zero"))


# switch() 조건문: 예제 4-9
x <- c(1,2,3,4)
type <- "var"
switch (type, 
        mean=mean(x),var=var(x),median=median(x),sum=sum(x)
)


# 반복문: 예제 4-11
i <- 1
for (i in 1:5) {
  print(rep(i,i))
}


i <- 1
while (i<6) {
  print(rep(i,i))
  i <- i+1
}

i <- 1
repeat{
  if(i>5)break
  print(rep(i,i))
  i <- i+1
}


# 예제 4-12
x <- 0
i <- 1
for (i in 1:10) {
  x <- x+i
}
x

x <- 0
i <- 1
while (i<=10) {
  x <- x+i
  i <- i+1
}
x

x <- 0
i <- 1
repeat{
  if(i>10)break
  x <- x+i
  i <- i+1
}
x


# break 분기문: 예제 4-17
x <- 0
i <- 1
for (i in 1:10) {
  x <- x+i
}
x


# 중첩반복문의 분기: 예제 4-18
for (i in 1:9) {
  if(i>3) break
  for (j in 1:9) {
    if(j>1) break
    cat(i,"*",j,"=",i*j,"\n") 
  }
}
# print() 는 하나의 벡터를 출력한다.
# cat() 는 concatenate로, 여러개의 벡터를 이어서 출력, 줄바꿈은 "\n"을 넣어야 한다.

for (i in -1:-9) {
  if(i>-9)next
  for (j in 1:9) {
    cat(i,"*",j,"=",i*j,"\n")
  }
}

# next 분기문: 예제 4-19
i <- 1
x <- 0
while(i<10){
  i <- i+1
  if(i<8)next
  print(i)
  x <- x+i
}
print(x)


# 연구과제 2-1
x <- c(34,35,32,56,45,23,56,43,45,65)


sum <- 0
for(i in x) {
  sum <- sum + i    
}
print(sum/length(x))

# 연구과제 2-2
print(mean(x))


# 연구과제 2-3
max;
min;
for(i in x){
  
  if(i > max){
    max = i
  }
  
  if(i < min){
    min = i
  }
  
}  
print((max+min)/2);


# 연구과제 2-4
print(median(x))


# 연구과제 3
num <- c(1:6)
for (i in num) {
  if(i<=3) 
    print(rep(i,7-2*i)) else
      print(rep(i,2*i-7))
}

i <- 1
while (i<7) {
  if(i<=3) 
    print(rep(i,7-2*i)) else
      print(rep(i,2*i-7))
  i <- i+1
}

i <- 1
repeat {
  if(i>6)break
  if(i<=3) 
    print(rep(i,7-2*i)) else
      print(rep(i,2*i-7))
  i <- i+1
}


a <- 5
for (i in 1:6) {
  if (i<4) {
    print(rep(i,a))
    a <- a-2
  } else {
    a <- a+2
    print(rep(i,a))
  }
}

a <- 5
i <- 1
while (i<7) {
  if (i<4) {
    print(rep(i,a))
    a <- a-2
    i <- i+1
  } else {
    a <- a+2
    print(rep(i,a))
    i <- i+1
  } 
}

a <- 5
i <- 1
repeat{
  if(i>6)break
  if (i<4) {
    print(rep(i,a))
    a <- a-2
    i <- i+1
  } else {
    a <- a+2
    print(rep(i,a))
    i <- i+1
  }
} 


v1 <- c(1:6)
num1 <- 5
num2 <- 1
for(i in v1){
  if(num1 > 0){
    print(rep(i,num1))
    num1 = num1 - 2
  }else if(num == 1){
    print(rep(i,num2))
    num2 = num2 + 2
  }
}

ls()
rm(list = ls())

# -----7강 실습 끝-----

# 8강에서 배우는 함수
# function() 함수를 생성하는 함수
# fix() 정의된 함수를 수정하는 함수
# source() 외부파일에서 내용을 가져오는 함수
# is.function() 객체가 함수인지 아닌지 알려주는 함수
# args() 함수의 매개변수들을 알려주는 함수
# attributes() 함수의 소스코드를 알려주는 함수

# -----8강 실습-----

d.mean <- function(data) {
  sum(data)/length(data)
}

x <- rnorm(100, mean = 3, sd=1.5)
d.mean(x)
x <- rnorm(1000, mean = 3, sd=1.5)
d.mean(x)
x <- rnorm(10000, mean = 3, sd=1.5)
d.mean(x)

f1 <- function(x,y){return(x+y)}
f2 <- function(x,y){return(x-y)}
f <- f1
f(1,2)
f <- f2
f(1,2)
g <- function(h,x,y){h(x,y)}
g(f1,1,2)
g(f2,1,2)

f_default <- function(data, num=1){
  d.min <- min(data)
  d.max <- max(data)
  switch(num, mean(data), var(data), c(d.min, d.max))
}

f_default(x,3)
is.function(f_default)


d.size<-function(x,y){
  ifelse(x>y, return("x > y"),
         ifelse(x<y, return("x < y"), 
                return("x = y")))  
}

d.size(3,4)

# ----- 8강 실습 끝 -----

# 9강에서 배우는 함수
# with() 데이터set에 지정한 함수를 적용해라
# table() 지정한 변수를 가지고 도수분포표를 만들어라
# xtabs() 지정한 두 변수를 가지고 크로스테이블을 만들어라
# barplot() 막대그래프를 그려라
# pie() 파이차트를 그려라
# names() 출력될 때 표시되는 이름을 바꿔라
# hist() 히스토그램을 그려라
# plot() 관측치를 그래프로 보여달라(?)
# density() 관측치들을 부드럽게 연결해서 확률밀도함수로 보여달라
# lines() 앞서 그린 그래프 위에 겹쳐서 선그래프를 그려라
# qqnorm() 정규분포를 따르는지 확인할 수 있는 그래프를 그려라
# qqline() 그려진 그래프 위에 겹쳐서 y=x 그래프를 그려라

# ----- 9강 실습 시작 -----
library(MASS)
head(Cars93)

# 기본막대그림
(tab <- with(Cars93,table(Type)))
barplot(tab, main = "Type of Car", xlab = "Type", ylab = "Number of Car", col = 1:6, 
        legend= c('Compact','Large','Midsize','Small','Sporty','Van'),
        names.arg = c('Compact','Large','Midsize','Small','Sporty','Van'))

# Side형 막대그림
tab1 <- with(Cars93,xtabs(~Type+AirBags))
barplot(tab1, col=rainbow(6), 
        legend = c('Compact','Large','Midsize','Small','Sporty','Van'),
        xlab = "Airbags", ylab = "Number of Cars", beside=T)

# Stacked 막대그림
barplot(tab1, col=rainbow(6), 
        legend = c('Compact','Large','Midsize','Small','Sporty','Van'),
        xlim = c(0, ncol(tab1)+2),
        xlab = "Airbags", ylab = "Number of Cars",
        args.legend = list(x=ncol(tab1)+2, y=max(colSums(tab1)), bty="n"))

# 파이차트
names(tab) <- c('COMPACT', 'MIDSIZE', 'SMALL', 'SPORTY', 'VAN')
pie(tab, col=topo.colors(6))

# 히스토그램
with(Cars93, hist(MPG.highway,
                  xlab = 'MPG in Highway', main = 'MPG in Highway'))

# 확률밀도함수 그림
install.packages("vcd")
library(vcd)
summary(Arthritis)
head(Arthritis)
with(Arthritis, plot(density(Age)))

library(MASS)
head(Cars93)
with(Cars93, hist(MPG.highway,
                  xlab = 'MPG in Highway', main = 'MPG in Highway',
                  probability = T))
with(Cars93, lines(density(MPG.highway), col='tomato3', lwd=2))

# Q-Q 그림
with(Cars93, qqnorm(Turn.circle, 
                    main='Q-Q plot of Turn.circle \n(U-turn space, feet)'))
with(Cars93, qqline(Turn.circle, col='orange', lwd=2))

ls()
rm(list = ls())
# ----- 9강 실습 끝 -----

# 10강에서 배우는 함수
# boxplot(Y축 변수~구분범주, 데이터) 상자그림을 그려라
# boxplot()[]$stats 상자그림 그릴 때 필요한 수치를 보여달라
# summary() 주요통계량을 알려달라
# subset() 부분집합을 뽑아내라
# qplot(X축 범주, Y축 변수, 데이터, geom=c("boxplot")) ggplot2 패키지로 상자그림 그리기
# ggplot(데이터, aes(x=X축 변수, y=Y축 변수)) + geom_boxplot() ggplot2 패키지로 상자그림 그리기
# pirateplot(formula = Y축 변수 ~ 구분범주1+구분범주2, data= ) pirate 그림 그리기
# ggplot(데이터, aes(x=X축 변수)) + geom_density(aes(group=그룹 변수, colour=그룹 변수)) 
# 그룹별 확률밀도함수 그리기
# par(mfrow=c()) base 패키지에서 여러 그래프 동시 정렬하기
# grid.arrange(그래프객체1, 그래프객체2, ..., ncol=열 개수, nrow=행 개수) 
# ggplot2 패키지에서 여러 그래프 동시 정렬하기
# with(데이터, spine(Y축 변수~X축 변수, breaks=구간 구분)) Spinogram 그리기
# cdplot(Y축 변수~X축 변수, 데이터) 조건부 밀도함수 그리기기


# ----- 10강 실습 시작 -----
library(MASS)
head(Cars93)

# 상자그림
boxplot(Min.Price~AirBags, data=Cars93)
boxplot(Min.Price~AirBags, data=Cars93)[]$stats
summary(subset(Cars93, AirBags=='Driver only')$Min.Price)
boxplot(Min.Price~AirBags, data=Cars93, 
        names=c("Driver & Passenger", "Driver only", "None"),
        col=c("orange", "cyan", "yellow"),
        ylab="Minimun Price", xlab="Airbag",
        ylim=c(0,50), boxwex=0.25
)
boxplot(Min.Price~AirBags, at=c(3,2,1), data=Cars93, 
        names=c("Driver & Passenger", "Driver only", "None"),
        col=c("orange", "cyan", "yellow"),
        ylab="Minimun Price", xlab="Airbag",
        ylim=c(0,50), boxwex=0.25
)

library(ggplot2)
qplot(AirBags, Min.Price, data=Cars93,
      geom=c("boxplot", "jitter"), fill=AirBags,
      ylab="Minimun Price", xlab="Airbags", alpha=I(.2)
)

p<-ggplot(Cars93, aes(x=AirBags, y=Min.Price)) +
  geom_boxplot(aes(fill=AirBags)) +
  scale_fill_viridis_d()

p + theme(legend.position="none") + xlab("Airbags") + ylab("Minimum Price")

# Pirate 그림
install.packages("yarrr")
library(yarrr)
library(MASS)
head(Cars93)

pirateplot(formula=MPG.city~Origin+DriveTrain,
           point.o=0.5, data=Cars93, 
           main="City MPG by Origin and Drive Train",
           inf.method='iqr'
)

# 그룹별 확률밀도함수 그림
library(ggplot2)
head(Cars93)

ggplot(Cars93, aes(x=MPG.highway)) + 
  geom_density(aes(group=Type, colour=Type)) +
  labs(x="MPG.highway", y="Density") + 
  ggtitle("Density of MPG in Highway by Type") +
  theme(plot.title=element_text(hjust=0.5))

ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Type, colour=Type)) +
  labs(x="MPG.highway", y="Density") + 
  ggtitle("Density of MPG in Highway by Type") +
  theme(plot.title=element_text(hjust=0.5))

# 여러 개의 그림을 배열
p1<- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Type, colour=Type)) +
  labs(x="MPG.highway", y="Density") + 
  ggtitle("Density of MPG in Highway by Type") +
  theme(plot.title=element_text(hjust=0.5))

p2<- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Origin, colour=Origin)) +
  labs(x="MPG.highway", y="Density") + 
  ggtitle("Density of MPG in Highway by Origin") +
  theme(plot.title=element_text(hjust=0.5))

install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, ncol=2)
grid.arrange(p1, p2, nrow=2)

# 4개 그림 동시 배열
p1<- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Type, colour=Type)) +
  labs(x=expression("MPG"^highway), y=expression("Density"[value])) + 
  ggtitle("Density of MPG in Highway by Type") +
  theme(plot.title=element_text(hjust=0.5)) +
  coord_cartesian(xlim=c(25,40))

p2 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Origin, colour=Origin)) +
  labs(x=expression("MPG"^highway), y=expression("Density"[value])) + 
  ggtitle("Density of MPG in Highway by Origin") +
  theme(plot.title=element_text(hjust=0.5))

p3 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=Man.trans.avail, colour=Man.trans.avail)) +
  labs(x=expression("MPG"^highway), y=expression("Density"[value])) + 
  ggtitle("Density of MPG in Highway \n by Manual Transmission Availability") +
  theme(plot.title=element_text(hjust=0.5))

p4 <- ggplot(Cars93, aes(x=MPG.highway)) + theme_bw() +
  geom_density(aes(group=AirBags, colour=AirBags)) +
  labs(x=expression("MPG"^highway), y=expression("Density"[value])) + 
  ggtitle(expression(paste("Density of MPG(",mu,")")^Highway)) +
  theme(plot.title=element_text(hjust=0.5))

grid.arrange(p1, p2, p3, p4, ncol=2, nrow=2)

# 호흡곡선 spinogram
install.packages("vcd")
library(vcd)
head(Arthritis)

with(Arthritis, spine(Improved~Age, breaks=quantile(Age)))
spine(Improved~Age, data=Arthritis, breaks='Scott')

# 조건부 밀도함수 그림 Conditional Density Plot
cdplot(Improved~Age, data=Arthritis)
with(Arthritis, rug(jitter(Age), col='white', quiet=TRUE))
# ----- 10강 실습 끝 -----

# ----- 11강 실습 시작 -----

# 이변수 연속형 변수 자료의 요약

# 기본 산점도
library(MASS)
with(Cars93, plot(Price, MPG.city, main="Price vs MPG.city",
                  xlab="Price", ylab="MPG in City", pch=19))
with(Cars93, abline(lm(MPG.city~Price), col="red", lwd=2))
with(Cars93, lines(lowess(Price, MPG.city), col="blue", lwd=2))
# locally weighted scatterplot smoothing (Cleveland 1981)
legend(40,40, lty=1, col=c("red", "blue"), c('regresstion', 'lowess'), lwd=2, bty='n')

# 다변수 자료의 요약

# 모자이크 그림
library(vcd)
summary(Arthritis)
art <- xtabs(~Treatment+Improved, data=Arthritis, subset=Sex=="Female")
art
mosaic(art, gp=shading_max)
# Pearson residuals = (observed freq - expected freq)/sqrt(expected)
mosaic(~Sex+Age+Survived, data=Titanic, 
       main="Survival on the Titanic", shade=TRUE, legend=TRUE)

# 다중 산점도
dat1 <- subset(Cars93, select=c(Min.Price, Price, Max.Price, MPG.city, MPG.highway))
pairs(dat1)

# 단순 산점도
with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in the city', main='Mileage'))

# 단순 산점도-그룹별 산점도
with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in the city', type='n'))
with(subset(Cars93, DriveTrain=='Front'), points(Price, MPG.city, col='orange', pch=19))
with(subset(Cars93, DriveTrain=='Rear'), points(Price, MPG.city, col='firebrick', pch=17))
with(subset(Cars93, DriveTrain=='4WD'), points(Price, MPG.city, col='black', pch=8))
legend("topright", legend=c('Front', 'Rear', '4WD'), 
       col=c('orange', 'firebrick', 'black'), pch=c(19, 17, 8), bty='n')

# 단순 산점도- 그룹별 회귀직선 추가
fit1 <- with(subset(Cars93, DriveTrain=='Front'), lm(MPG.city~Price))
fit2 <- with(subset(Cars93, DriveTrain=='Rear'), lm(MPG.city~Price))
fit3 <- with(subset(Cars93, DriveTrain=='4WD'), lm(MPG.city~Price))

xx1 <- subset(Cars93, DriveTrain=='Front')$Price
yy1 <- fit1$coef[1] + fit1$coef[2]*xx1

xx2 <- subset(Cars93, DriveTrain=='Rear')$Price
yy2 <- fit2$coef[1] + fit2$coef[2]*xx2

xx3 <- subset(Cars93, DriveTrain=='4WD')$Price
yy3 <- fit3$coef[1] + fit3$coef[2]*xx3

with(Cars93, plot(Price, MPG.city, xlab='Price', ylab='MPG in City', type='n'))
with(subset(Cars93, DriveTrain=='Front'), points(Price, MPG.city, col='orange', pch=19))
with(subset(Cars93, DriveTrain=='Rear'), points(Price, MPG.city, col='firebrick', pch=17))
with(subset(Cars93, DriveTrain=='4WD'), points(Price, MPG.city, col='black', pch=8))
legend("topright", legend=c('Front', 'Rear', '4WD'), 
       col=c('orange', 'firebrick', 'black'), pch=c(19, 17, 8), bty='n')

lines(xx1, yy1, col='orange', lwd=2)
lines(xx2, yy2, col='firebrick', lwd=2)
lines(xx3, yy3, col='black', lwd=2)

# 여러 개의 그림을 동시에 표현
par(mfrow=c(2,2))
with(subset(Cars93, DriveTrain=='Front'), 
     plot(Price, MPG.city, col='orange', pch=19, main='Front'))
with(subset(Cars93, DriveTrain=='Rear'), 
     plot(Price, MPG.city, col='firebrick', pch=17, main='Rear'))
with(subset(Cars93, DriveTrain=='4WD'), 
     plot(Price, MPG.city, col='black', pch=8, main='4WD'))

dev.off()

# 그룹별 산점도
library(ggplot2)
qplot(Wheelbase, Width, data=Cars93, shape=Type, color=Type, 
      facets=Origin~AirBags, size=I(2), xlab="Wheelbase", ylab="Car Width")

# 나무지도 그림
install.packages("treemap")
library(treemap)
data(GNI2014)
summary(GNI2014)
treemap(GNI2014, index=c("continent", "iso3"), 
        vSize="population", vColor="GNI", type="value")
treemap(Cars93, index=c("Manufacturer", "Make"),
        vSize="Price", vColor="AirBags", type="categorical")

# 풍선그림
install.packages("gplots")
library(gplots)
dt <- with(Cars93, xtabs(~AirBags+Type))
balloonplot(dt, main="Airbags by Car type", 
            xlab="", ylab="", label=FALSE, show.margins=FALSE)
balloonplot(dt, main="Airbags by Car type", 
            xlab="", ylab="", label=TRUE, show.margins=TRUE)

dev.off()

# 두 변수 모자이크 그림-graphics 패키지
install.packages("graphics")
library(graphics)
mosaicplot(dt, color =TRUE, las=1, main="Airbags by Car type")

# 다변수 모자이크 그림-graphics 패키지
mosaicplot(~DriveTrain+AirBags+Origin, las=1, 
           main="Drive Train by Airbags and Origin", ylab='Airbag type', xlab='Drive Train',
           data=Cars93, color=TRUE)

# ----- 11강 실습 끝 -----

# 12강에서 배우는 함수

# ----- 12강 실습 시작 -----
install.packages("magrittr")
install.packages("corrr")
install.packages("Hmisc")
install.packages("jpeg")
install.packages("png")
install.packages("RColorBrewer")

# 1-상관도 그림
library(magrittr)
mtcars %>% head
mtcars %>% tan %>% cos %>% sin %>% head %>% round(2)

library(corrr)
mtcars %>% correlate() %>% fashion()
mtcars %>% correlate() %>% rplot()

# 2-상관도 네트워크 그림
mtcars %>% correlate() %>% network_plot(min_cor=.3)

# 3-변수 군집 그림
library(MASS)
library(Hmisc)
temp <- Cars93[ , c('Price', 'MPG.city', 'Horsepower', 'RPM', 'Length', 'Wheelbase')]
plot(v <- varclus(~. , data=temp, similarity="spear"))

# 4-jpeg 그림 불러오기
library(jpeg)
sales.amount <- c(1.5, 2.3, 5.4, 7.5, 9, 8)
img <- readJPEG("C:/Users/bluei/Rstudio_data/audiQ7.jpg")
plot(c(0.5, 6.5), c(0, 10), axes=F, cex.lab=1.3, type='n',
     xlab='Months', ylab='Sales (in million dollars)')
axis(1, at=c(1, 2, 3, 4, 5, 6), labels=c('January', 'February', 'March', 'April', 'May', 'June'), cex.axis=1.2)
axis(2, at=c(0, 2, 4, 6, 8, 10), labels=c('0', '2', '4', '6', '8', '10'), cex.axis=1.2)
lines(1:6, sales.amount, lwd=2, col='orange')
for (jj in 1:6) {
  rasterImage(img, jj-0.3, sales.amount[jj]-0.3, jj+0.3, sales.amount[jj]+0.3)
}

# 5-png 그림 불러오기
library(png)
img <- readPNG("C:/Users/bluei/Rstudio_data/MPG.png")
plot(c(1, 6), c(15, 46), axes=F, cex.lab=1.3, type='n',
     xlab='Engine Size', ylab='MPG in city')
rasterImage(img, 0.7, 14.5, 6.1, 46.0)
axis(1, at=c(1, 2, 3, 4, 5, 6), labels=c('1', '2', '3', '4', '5', '6'), cex.axis=1.2)
axis(2, at=seq(15, 45, 5), labels=seq(15, 45, 5), cex.axis=1.2)
with(subset(Cars93, Origin=='non-USA'), points(EngineSize, MPG.city, col=2, pch=16))
with(subset(Cars93, Origin=='USA'), points(EngineSize, MPG.city, col=4, pch=16))
legend('topright', bty=1, c('non-USA', 'USA'), col=c(2, 4), lwd=2, pch=16)
text(4, 35, pos=4, 'Cars in USA have low MPGs in City, \n while having large engines compared \n to non-USA.', col="white")

# 6-그림 저장

jpeg(file="mpg_engine_size.jpg", width=10, height=10, units='in', res=600, bg="white")

plot(c(1, 6), c(15, 46), axes=F, cex.lab=1.3, type='n',
     xlab='Engine Size', ylab='MPG in city')
rasterImage(img, 0.7, 14.5, 6.1, 46.0)
axis(1, at=c(1, 2, 3, 4, 5, 6), labels=c('1', '2', '3', '4', '5', '6'), cex.axis=1.2)
axis(2, at=seq(15, 45, 5), labels=seq(15, 45, 5), cex.axis=1.2)
with(subset(Cars93, Origin=='non-USA'), points(EngineSize, MPG.city, col=2, pch=16))
with(subset(Cars93, Origin=='USA'), points(EngineSize, MPG.city, col=4, pch=16))
legend('topright', bty=1, c('non-USA', 'USA'), col=c(2, 4), lwd=2, pch=16)
text(4, 35, pos=4, 'Cars in USA have low MPGs in City, \n while having large engines compared \n to non-USA.', col="white")
dev.off()

pdf(file="mpg_engine_size.pdf", width=10, height=10, bg="white", paper='special')

plot(c(1, 6), c(15, 46), axes=F, cex.lab=1.3, type='n',
     xlab='Engine Size', ylab='MPG in city')
rasterImage(img, 0.7, 14.5, 6.1, 46.0)
axis(1, at=c(1, 2, 3, 4, 5, 6), labels=c('1', '2', '3', '4', '5', '6'), cex.axis=1.2)
axis(2, at=seq(15, 45, 5), labels=seq(15, 45, 5), cex.axis=1.2)
with(subset(Cars93, Origin=='non-USA'), points(EngineSize, MPG.city, col=2, pch=16))
with(subset(Cars93, Origin=='USA'), points(EngineSize, MPG.city, col=4, pch=16))
legend('topright', bty=1, c('non-USA', 'USA'), col=c(2, 4), lwd=2, pch=16)
text(4, 35, pos=4, 'Cars in USA have low MPGs in City, \n while having large engines compared \n to non-USA.', col="white")
dev.off()

# 7-ggplot2로 subgroup있는 산점도 그리기
library(ggplot2)
qplot(Horsepower, Price, data=Cars93, colour=AirBags, size=AirBags)

Cars93$manual <- with(Cars93, ifelse(Man.trans.avail=='No', 'Manual_Trans_No', 'Manual_Trans_Yes'))
with(Cars93, qplot(Horsepower, Price, data=Cars93, facets=manual~Origin))

# 8-qplot 이용해 확률밀도함수 그림
qplot(Fuel.tank.capacity, data=Cars93, 
      geom="density", fill=Origin, alpha=I(.2),
      main="Fuel tank capacity by Origin", 
      xlab="Fuel tank capacity (US gallons)", ylab="Density") +
  theme(plot.title=element_text(hjust=0.5))

# 9-산점도에 회귀선 추가하기
ggplot(Cars93, aes(x=Horsepower, y=Price)) +
  geom_point(shape=16) +
  geom_smooth(method=lm, se=FALSE)

# 10-Smoothing Line 산점도 그리기
qplot(Horsepower, Price, data=Cars93, 
      geom=c("point", "smooth"),
      colour=Origin, 
      main="Price vs Horsepower by Origin",
      xlab="Horsepower", ylab="Price") +
  theme(plot.title=element_text(hjust=0.5))

# 11-연속형 변수가 추가된 산점도
ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width)) +
  geom_point(shape=16) +
  scale_color_gradient(low="yellow", high="red")

ggplot(Cars93, aes(x=Horsepower, y=Price, color=Width)) +
  geom_point(shape=16) +
  scale_color_gradientn(colors=rainbow(5))

# 12-명목형 변수가 추가된 산점도
library(RColorBrewer)
brewer.pal.info

ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) +
  geom_point(size=3) +
  scale_shape_manual(values=c(16, 17, 18)) +
  scale_color_brewer(palette="Spectral")

ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) +
  geom_point(size=3) +
  scale_shape_manual(values=c(16, 17, 18)) +
  scale_color_brewer(palette="Dark2") +
  geom_smooth(method=lm, se=FALSE)

ggplot(Cars93, aes(x=Horsepower, y=Price, shape=AirBags, color=AirBags)) +
  geom_point(size=3) +
  scale_shape_manual(values=c(16, 17, 18)) +
  scale_color_brewer(palette="Dark2") +
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)

# ----- 12강 실습 끝 -----
# ----- 13강 실습 시작 -----

install.packages("doBy")
install.packages("fmsb")
install.packages("SwissAir")
install.packages("hexbin")
install.packages("IDPmisc")

# 1-레이더 차트
library(MASS)
library(doBy)
mean_by_Type2 <- summaryBy(MPG.highway+RPM+Horsepower+Weight+Length+Price~Type, data=Cars93, FUN=c(mean))
mean_by_Type2

df2 <- mean_by_Type2[ ,c(2:7)]
df_radarchart <- function(df) {
  df <- data.frame(df)
  dfmax <- apply(df, 2, max)
  dfmin <- apply(df, 2, min)
  as.data.frame(rbind(dfmax, dfmin, df))
}
mean_by_Type <- df_radarchart(df2)
row.names(mean_by_Type) <-c('max', 'min', names(table(Cars93$Type)))
mean_by_Type

# 2-육각 레이더 차트
library(fmsb)
radarchart(df=mean_by_Type, seg=3, pty=16, pcol=1:6, plty=1, plwd=2,
           title=c("Radar chart by Car Types")
)
legend("topleft", legend=mean_by_Type2$Type, col=c(1:6), lty=1, lwd=2)

# 3-오각 레이더 차트
dat <- Cars93[2:6, c('Price', 'Horsepower', 'Turn.circle', 'Rear.seat.room', 'Luggage.room')]
datmax <- apply(dat, 2, max)
datmin <- apply(dat, 2, min)
dat <- rbind(datmax, datmin, dat)
radarchart(dat, seg=10, plty=1,
           vlabels=c('Price', 'Horsepower', 'U-turn space\n(feet)', 'Rear seat room\n(inches)', 'Luggage capacity\n(cubic feet)'),
           title="5 segments, with specified vlabels",
           vlcex=0.8, pcol=rainbow(5))
legend("topleft", legend=Cars93[2:6, 'Make'], col=rainbow(5), lty=1, lwd=1)

# 4-상자그림 고밀도 산점도
library(ggplot2)
summary(diamonds)
head(diamonds)
str(diamonds)
dim(diamonds)

ggplot(diamonds, aes(carat, price)) +
  stat_bin2d(bins=25, colour="gray50")

ggplot(diamonds, aes(carat, price)) +
  stat_bin2d(bins=40, colour="gray50") +
  scale_x_continuous(limits=c(0, 6))

ggplot(diamonds, aes(carat, price)) +
  stat_bin2d(bins=40, colour="gray50") +
  scale_x_continuous(limits=c(0, 6)) +
  scale_fill_gradientn(colours=c('yellow', 'green', 'blue', 'red')) +
  labs(x="Carat", y="Price")

# 5-고밀도 자료 일반 산점도
library(SwissAir)
dim(AirQual)
head(AirQual)
summary(AirQual)

with(AirQual, plot(ad.WS~ad.O3, xlab='O3', ylab='WS'))

# 6-Smoothed density 방법 이용한 산점도
with(AirQual, smoothScatter(ad.WS~ad.O3, 
                            main='Scatter plot by smoothed densities',
                            xlab='O3', ylab='WS'))

# 7-고밀도 자료 육면 상자그림
library(hexbin)
with(AirQual, plot(hexbin(ad.O3, ad.WS, xbins=100), 
                   main='Hexagonal binning(bins=100)',
                   xlab='O3', ylab='WS'))

with(AirQual, plot(hexbin(ad.O3, ad.WS, xbins=30), 
                   main='Hexagonal binning(bins=30)',
                   xlab='O3', ylab='WS'))

# 8-이미지 산점도
library(IDPmisc)
with(AirQual, iplot(ad.O3, ad.WS, xlab='O3', ylab='WS', 
                    main='Image Scatter Plot with \n Color Indicating Density'))

# 9-다변수 고밀도 자료 이미지 산점도
ipairs(subset(AirQual, select=c(ad.O3, ad.WS, ad.WD)))
