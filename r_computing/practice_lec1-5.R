install.packages("forcats")
library(forcats)

# ---- 4강에서 배우는 함수 ----
#c()
#scan()
#seq()
#rep()
#rev()
#replace()
#append()
#sort()
#rank()
#order()
#matrix()
#length()
#mode()
#dim()
#rbind()
#cbind()
#apply()
#sweep()

# ---- 4강 실습 시작 ----
x<-c(rep(3,3),seq(3,7,2),rev(seq(3,7,length=3)),rep(4,3))
x
sort(x)
rank(x)
order(x)

matr<-matrix(1:9,nrow = 3)
matr
length(matr)
mode(matr)
dim(matr)

r1<-c(1,4,7)
r2<-c(2,5,8)
r3<-c(3,6,9)
rbind(r1,r2,r3)

r1<-c(1,2,3); r2<-c(4,5,6); r3<-c(7,8,9)
rbind(r1,r2,r3)

c1<-c(1:3); c2<-c(4:6); c3<-c(7:9); cbind(c1,c2,c3)

m1<-1:9; dim(m1)<-c(3,3)
m1

mat<-matrix(1:9,nrow = 3,byrow = T); mat
mat[1,]
mat[,3]
mat[2,3]
mat[mat[,3]>4,2]

Height<-c(140,155,142,175)
size.1<-matrix(c(130,26,110,24,118,25,112,25),
               ncol = 2,byrow = T,
               dimnames = list(c("Lee","Kim","Park","Choi"),c("Weight","Waist")))
size.1               
size<-cbind(size.1,Height)
size

colmean<-apply(size,2,mean); colmean
rowmean<-apply(size,1,mean); rowmean
colvar<-apply(size,2,var); colvar
rowvar<-apply(size,1,var); rowvar
colmed<-apply(size,2,median); colmed

sweep(size,2,colmean)
sweep(size,1,rowmean)
sweep(size,1,c(1,2,3,4),"+")
sweep(size,1,c(1,2,3,4))

m1<-matrix(1:4,nrow = 2)
m2<-matrix(5:8,nrow = 2)
m1; m2
m1%*%m2
t(m1); solve(m1)

# ---- 4강 끝 ----

# 5강에서 배우는 함수

# array() 배열을 만들어라
# dimnames() 행, 열, 행렬 이름을 붙여라
# length() 배열 자료의 개수를 알려달라
# mode() 배열 자료의 형태를 알려달라
# dim() 자료의 차원을 알려달라; 지정하는대로 차원을 만들어서 벡터를 넣어라/ 행렬: c(행,열) 배열: c(행,열,행렬)
# list() 리스트를 만들어라
# names() 리스트 안 각 성분(변수)의 이름을 알려달라
# read.table() 공백으로 구분된 텍스트 파일을 열어라
# read.csv() 콤마로 구분된 csv 파일을 열어라
# data.frame() 지정한 객체를 모두 합쳐서 데이터프레임으로 만들어라
# as.data.frame() 지정한 객체(주로 행렬)를 데이터프레임으로 바꿔라
# cbind() 데이터프레임의 열을 유지하면서 옆으로 합쳐라 / 행 개수가 같아야 함
# rbind() 데이터프레임의 행을 유지하면서 아래로 합쳐라 / 변수명이 같아야 함
# merge() 데이터프레임의 변수를 유지하면서 값을 병합해라

# ---- 5강 실습 시작 ----
library(forcats)

arr<-array(1:24,c(3,3,2))
dimnames(arr)<-list(paste("row",c(1:3)),paste("co1",c(1:3)),paste("ar",c(1:2)))
arr
length(arr)
mode(arr)
dim(arr)
dimnames(arr)

# 보기3-17
array(1:6) # 1차원 배열을 만들어라
array(1:6,c(2,3)) # 2차원(2행3열) 배열을 만들어라
array(1:8,c(2,2,2)) # 3차원(2행2열, 2개) 배열을 만들어라
arr<-c(1:24); dim(arr)<-c(3,4,2) # arr벡터에 1~24 넣고, arr를 3차원(3행4열, 2개) 배열로 만들어라
arr

# 보기3-18
ary1<-array(1:8,c(2,2,2)) # ary1벡터에 배열을 넣는데, 1~8로 2행2열, 2개로 만들어서 넣어라
ary2<-array(8:1,dim = c(2,2,2)) # ary2벡터에 배열을 넣는데, 8~1로 2행2열, 2개로 만들어서 넣어라 
ary1+ary2 
ary1-ary2
ary1*ary2 # ary1과 ary2의 원소를 자리별로 곱해라
ary1%*%ary2 # ary1과 ary2의 원소를 자리별로 곱하고 모두 더해라
sum(ary1*ary2)
ary1[,,1] # ary1의 1번행렬을 알려달라
ary1[1,1,] # ary1 모든 행렬의 1행1열 원소를 알려달라
ary1[1,,-2] # ary1의 1행 원소를 2번행렬 빼고 알려달라
ary1[1,,1] # ary1의 1행 원소를 1번행렬만 알려달라 

# 보기3-19
a<-1:10
b<-11:15
klist<-list(vec1=a,vec2=b,descrip="example")
length(klist)
mode(klist)
names(klist)

# 보기3-20
list1<-list("A",1:8)
list1[[3]]<-c(T,F)
list1[[2]][9]<-c(9) # list1 2번성분 안에 9번원소에 9를 넣어 추가해라 
list1[3]<-NULL # list1의 3번성분을 없애라
list1[[2]]<-list1[[2]][-9] # list1의 2번성분에서 9번원소를 없애라 (9번원소를 뺀 것을 넣어라)
list1

# 보기3-21
nlist<-list(vec1=a,vec2=b,descrip="example")
nlist[[2]][5]
nlist$vec2[c(2,3)]

# 보기3-22
name<-c("Lee","Park","So","Kim","Yoon")
age<-c(55,47,35,26,29)
sex<-c("M","F","M","F","M")
story<-cbind(name,age,sex)
num<-c(1,2,3,4,5)
story<-cbind(num,story)
story
write.table(story,'story.txt',quote = FALSE)
d2<-read.table("C:/Users/bluei/Rstudio_data/story.txt", row.names = 'num', header = T)
d2

# 보기3-23
char1<-rep(LETTERS[1:3],c(2,2,1)) # char1벡터를 만들고 알파벳 3개를 차례로 2번, 2번, 1번 반복해서 넣어라
num1<-rep(1:3,c(2,2,1)) # num1벡터를 만들고 숫자 3개를 차례로 2번, 2번, 1번 반복해서 넣어라
test1<-data.frame(char1,num1) # test1벡터를 만들고 char1, num1을 합쳐 데이터프레임으로 만들어서 넣어라
test1

# 보기3-24
a1<-c(letters[1:15])
dim(a1)<-c(5,3)
test3<-as.data.frame(a1)
test3

# 보기3-25
cbind(test1,test3)
char1<-rep(LETTERS[1:3], c(1,2,2))
num1<-rep(1:3,c(1,1,3))
test4<-data.frame(char1,num1)
rbind(test1,test4)
merge(test1,test4)

ls()
rm(list = ls())
# ----- 5강 실습 끝-----

# 6강에서 배우는 연산자

# +; -; *; /; ^ 산술연산자 - componentwise (같은 위치의 원소끼리)
# %/%; %*%/  산술연산자 - 정수 나눗셈; 행렬의 수학적 곱셈
# ==; !=; <=; <; >; >=  비교연산자 - 같다; 다르다; 작거나 같다; 작다; 크다; 크거나 같다
# &&; &; ||; | 논리연산자 - and(스칼라); and(벡터); or(스칼라); or(벡터)
# union(); intersect(); setdiff(); setequal(); c%in%x; choose()
# 집합연산자 - 합집합; 교집합; 차집합; 같은가; 원소c가 집합x에 속하는가; 부분집합의 수(combination계산)

