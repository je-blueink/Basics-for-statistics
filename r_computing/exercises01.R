# 1) 자신의 학번의 각 자리로 이루어진 벡터 x를 정의하시오.
x <- c(2,0,2,2,3,5,3,6,8,0,5,2)
x

# 2) R의 통계함수를 이용하여 벡터 x의 평균, 분산, 중앙값을 구하시오. 
mean(x); var(x); median(x)

# 3) 자신이 정의한 벡터 x의 맨 끝자리를 결측치 NA로 바꾸어 벡터 y를 정의하시오. 
y <- replace(x,12,NA)
y

# 4) 벡터 y의 평균, 분산, 중앙값을 구하시오. 
mean(y,na.rm=TRUE); var(y,na.rm=T); median(y,na.rm=T)
mean(y); var(y); median(y)

# 2. R에 내장되어 있는 USArrests 데이터를 이용하여 다음 각각의 물음에 답하시오.
search()
data(package="datasets")
USArrests
str(USArrests)
head(USArrests)
write.table(USArrests,'db_USArrests.txt',quote = F)
write.csv(USArrests,'csv_USArrest.csv',quote = F)

# 1) [ ]기호를 이용하여 Indiana 주의 UrbanPop 값을 추출하시오.
USArrests["Indiana","UrbanPop"]

# 2) 5행부터 50행까지를 제외한 나머지 행의 1열에서 3열까지의 원소를 추출하시오.
USArrests[-5:-50,1:3]

# 3) USArrests에서 Assault 값이 159보다 큰 주들의 Murder 평균값을 구하시오.
data_murder <- USArrests[USArrests[,"Assault"]>159,"Murder"]
data_murder
mean(data_murder)

# 3. 어느 스터디 모임 12 명의 자격증 모의시험 응시 결과, 
# 취득 점수가 82, 65, 73, 72, 91, 83, 66, 71, 80, 55, 79, 96과 같이 나타났다고 하자. 
# 다음 물음에 답하시오. (총 9점)

# 1) x라는 객체에 점수를 입력하여 12개의 원소를 갖는 벡터 구조를 생성하시오.
x <- c(82, 65, 73, 72, 91, 83, 66, 71, 80, 55, 79, 96)
x

# 2) 12개의 NA 값을 갖는 grade라는 객체를 생성하시오.
grade <- c(rep(NA,12))
grade

# 3) x에 입력된 점수를 하나씩 읽으면서 90점 이상이면 “A”, 80점 이상이면 “B”, 70점 이상이면 “C”, 60점 이상이면 “D”, 60 점 미만이면 “F”를 부여하여 grade에 저장하시오.
for (i in 1:12) {
  ifelse(x[i]>=90,  grade[i] <- "A", 
         ifelse(x[i]>=80, grade[i] <- "B", 
                ifelse(x[i]>=70, grade[i] <- "C", 
                       ifelse(x[i]>=60, grade[i] <- "D", 
                              grade[i] <- "F"))))  
}
grade

# 4) x와 grade를 병합하여 12행 2열 형태로 나란히 출력하시오.
grade_mat <- data.frame(x,grade)
grade_mat

# 4. 반복문을 실행하여 아래와 같은 결과를 출력해 보려고 한다. 
# 단, 반복문의 인덱스 i를 1에서 5까지 증가시키면서 (즉, i in 1:5) 
# 적절한 함수 및 연산을 이용하여 출력한다. 다음 물음에 답하라.

# [1] 3
# [1] 5 5
# [1] 7 7 7 
# [1] 9 9 9 9 
# [1] 11 11 11 11 11

# 1) for 반복문을 1회 이용하여 위의 결과를 출력해 보시오.
for (i in 1:5) {
  print(rep(2*i+1, i))
}

# 2) while 반복문을 1회 이용하여 위의 결과를 출력해 보시오.
i <- 1
while (i<6) {
  print(rep(2*i+1, i))
  i <- i+1
}

p <- seq(3, 11, 2); i <- 1
while (i<6) {
  print(rep(p[i], i))
  i <- i+1
}

# 3) repeat 반복문을 1회 이용하여 위의 결과를 출력해 보시오.
i <- 1
repeat{
  if(i>5)break
  print(rep(2*i+1, i))
  i <- i+1
}

q <- 1 ; i <- 1
repeat{
  if(i>5)break
  q <- q+2
  print(rep(q, i))
  i <- i+1
}

ls()
rm(list = ls())