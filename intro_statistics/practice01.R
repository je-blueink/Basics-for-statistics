install.packages("forcats")
library(forcats)

obesity<-factor(c("underweight", "normal", "overweight", "obese"),
                levels = c("underweight", "normal", "overweight", "obese"))
count<-c(6, 69, 27, 13)
perc<-count/sum(count)*100
dat2<-data.frame(obesity, count, perc)

ggplot(data = dat2) + geom_bar(mapping = aes(x=obesity, y=perc), stat="identity") + 
  xlab("Obesity") + ylab("Percentage(%)")

w1<-scan()
23                               
4
w1<-scan()
23
4
5
6
7
dat3<-data.frame()
dat3<-edit(dat3)
dat3

# ---- 배우는 함수 ----
#sink()
#summary()
#cbind()
#rbind()
#write.csv()
#read.csv()
#write.table()
#read.table()

# ---- 실습 시작 ----

setwd('C:/Users/bluei/R_practice')
sink('printa.txt')
summary("iris")
sink()

x<-c(1,2,3,4,5)
y<-c(10,20,30,40,50)
dat<-cbind(x,y)
dat

write.csv(dat,'dat_exam1.csv',quote = FALSE)
write.table(dat,'dat_exam2.txt',sep = ",",quote = F)

dat2<-read.csv('dat_exam1.csv')
dat2

write.table(dat3,'dat3_exam1.txt')
nadat<-read.table('dat3_exam1.txt',na.strings = 'aa',header = T)

setwd('C:/Users/bluei/R_practice')
ls()
rm(list=ls())

score<-c(93,83,91,68,75,87,89,96,97,67,83,81,87,80,64,
         83,88,76,91,78,72,80,69,80,84,71,91,81,88,73)
hist(score)
hist(score, main="")

rv<-c(0.8,0.8,0.8,0.9,0.9,0.9,0.9,0.9,
      1,1,1.8,
      2,2.1,2.3,2.4,2.8,2.9,
      3,3.2,3.3,3.5,3.8,3.8,3.9,
      4,4.2,4.4,4.5,
      5.1,5.3,5.3,5.4,
      14,17,18,19,
      21,21,23,25,27,28,32,34,36,
      41,42,44,48,49,
      51,54,59,60,61,62,80,
      240)
hist(rv)
hist(rv, main = "", xlab = "CRP", breaks = seq(0,240,20))

set.seed(2021)
rn<-c(rnorm(100,5,2), rnorm(100,10,2))
hist(rn)
hist(rn, breaks = 50, main = "", xlab = "value")

# ---- ex 2-15 ----

age<-c(57, 61, 47, 57, 48, 58, 57, 61, 54, 50, 68, 51)
boxplot(age, ylab="Age" )

# ---- ex 2-16 ----

member<-c(92, 107, 180, 90, 78, 91, 102, 88, 
          106, 125, 95, 102, 162)
boxplot(member, ylab="Number of board members")

# ---- ex 2-16의 요약통계량 ----
mean(member)
var(member)
sd(member)
median(member)
fivenum(member) #최솟값, 1사분위수, 중앙값, 3사분위수, 최댓값
IQR(member) #사분위수 범위, Interquartile Range, Q3-Q1
range(member)

# ----- 8강 (이항분포의 정규근사) ----
pbinom(7,100,0.05)-pbinom(2,100,0.05)
pnorm(0.918,0,1)-pnorm(-0.918,0,1)
# ---- ex 6-6 (모평균 가설검정) ----
n <- 10; s <- 0.2; bar_x <- 12.2; mu0 <- 12; alpha <-0.05
ttest = (bar_x-mu0)/(s/sqrt(n)) # 검정통계량
ttest_cr = qt(1-alpha/2, n-1) # 기각역
ttest_pv = (1-pt(ttest, n-1))*2 # 유의확률
cat("검정통계량값:", ttest, "기각역:", ttest_cr, "유의확률:", ttest_pv)

# ---- ex 6-7 (모평균 가설검정) ----
book <- c(5, 23, 20, 1, 10, 15, 15, 10, 9, 13, 18, 11, 18, 20, 19, 19)
t.test(book, mu=11, alternative = "greater")

# ---- ex 6-8 (모비율 가설검정) ----
p0 <- 0.6; n <- 50; hat_p <- 0.7; alpha <- 0.05
ptest <- (hat_p-p0)/sqrt(p0*(1-p0)/n)
ptest_cr <- qnorm(1-alpha)
ptest_pv <- 1-pnorm(ptest)
cat("검정통계량값:", ptest, "기각역:", ptest_cr, "유의확률:", ptest_pv)

# ---- ex 6-10 (모분산 가설검정) ----
n <- 12; S <- 4; alpha <- 0.05
book <- c(5, 23, 20, 1, 10, 15, 15, 10, 9, 13, 18, 11)
vtest <- var(book)*(n-1)/S^2
vtest_cr <- qchisq(1-alpha, n-1)
vtest_pv <- 1-pchisq(vtest, n-1)
cat("검정통계량값:", vtest, "기각역:", vtest_cr, "유의확률:", vtest_pv)

# --- 범주형 데이터 검정 ---
# 프로그램 7-4

# 분할표를 만들어서 넣기
table <- matrix(c(20, 13, 30, 12), nrow = 2)
table
chisq.test(table, correct = F)

# 데이터 벡터를 넣기
A <- c(rep("st", 50), rep("ds", 25))
B <- c(rep("Y", 20), rep("N", 30), rep("Y", 13), rep("N", 12))
chisq.test(x=A, y=B, correct=F)

# 프로그램 7-5

badcheck <- c(0:3)
obs <-c(33, 15, 9, 3)
hat.m <- sum(badcheck*obs)/sum(obs) # 모수 m 추정량 계산
(p.x <- round(dpois(badcheck, hat.m), 3)) # 포아송분포에 따른 확률 계산
sum(p.x)
p.x[4] <- 1-sum(p.x[1:3]) # 확률 총합이 1이 되도록 보정
p.x
sum(p.x)
(exp <- p.x*60)     # 기대도수 계산
obs1 <- c(33, 15, 12)  # 도수가 작은 범주 합산
p.x1 <- c(p.x[1:2], 1-sum(p.x[1:2]))  
p.x1
(ch.test <- chisq.test(obs1, p=p.x1))
ch.test$statistic > qchisq(0.95, 1)  # 검정통계량과 자유도 1, a=0.05 인 임곗값 비교
