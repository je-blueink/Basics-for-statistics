rm(list=ls())
install.packages("psych")
library(psych)
install.packages("aplpack")
library(aplpack)

head(mtcars) # 데이터 형태 확인
summary(mtcars) # 데이터 구성 확인
dim(mtcars) # 데이터 크기 확인

# 책 2(1) 결측치 제거하는 명령, 변수별 결측치 개수
q2 <- mtcars
q2[q2==0] <- NA
sum(is.na(q2))
colSums(is.na(q2))
q2 <- na.omit(q2)
head(q2)

# 책 2(2) 변수 별 평균, 표준편차, 최솟값, 최댓값, 중앙값, 제1사분위수, 제3사분위수
summary(q2) # 평균, 다섯숫자요약 구하기
sapply(q2, sd) # 표준편차 구하기

# 책 2(3) 변수 별 상자 그림, 히스토그램
par(mfrow=c(1,1))
boxplot(q2)
title("boxplot of mtcars")

# 히스토그램
par(mfrow=c(2,3))
hist(q2$mpg)
hist(q2$disp)
hist(q2$hp)
hist(q2$drat)
hist(q2$wt)
hist(q2$qsec)

# 책 4(1) 전공별 중간/기말 성적 기술통계량
stscore <- read.csv("C:/Users/bluei/Downloads/Downloads_KNOU/statscore.csv", header=T)
head(stscore) # csv 파일 열고 데이터 확인
describeBy(stscore[,2:3], stscore$major) # 전공별 기술통계량 확인

# 책 4(2) 전공별 중간/기말 성적 히스토그램
maj_stat <- stscore[stscore$major=="STAT",] 
maj_comp <- stscore[stscore$major=="COMP",]

par(mfrow=c(2,2))
hist(maj_stat$midterm)
hist(maj_stat$final)
hist(maj_comp$midterm)
hist(maj_comp$final)

# 책 4(3) 전공별 중간/기말 성적 상자그림, 줄기-잎그림
maj_stat # 데이터프레임 확인
par(mfrow=c(1,2))
boxplot(maj_stat[,2:3]) # 통계학과, 성적 부분만 선택해 상자그림 그리기
title("Score of stat dept.")
boxplot(maj_comp[,2:3]) # 컴퓨터과, 성적 부분만 선택해 상자그림 그리기
title(("Score of comp dept."))

stem.leaf.backback(maj_stat$midterm, maj_comp$midterm) 
# 중간고사 성적 줄기-잎그림
stem.leaf.backback(maj_stat$final, maj_comp$final)
# 기말고사 성적 줄기-잎그림

# 워크북 1
score$total <- score$midterm + score$final

# 워크북 2
sapply(score[,-c(1:2)], mean, na.rm=T)
