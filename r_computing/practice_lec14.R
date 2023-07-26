# ----- 14강 실습 시작 -----

install.packages("maps")
install.packages("maptools")
install.packages("igraph")

# 1-단계구분도
library(ggplot2)
library(maps)
library(maptools)

safety <- read.csv('data_2018_지역안전등급.csv', header=T)
head(safety)
map <- read.csv('mapv2_final.csv', header=T)
head(map)

ggplot(safety, aes(map_id=region, fill=교통사고)) +
  geom_map(map=map, alpha=0.3, colour='snow4', size=0.1) +
  theme(legend.position=c(0.9, 0.3)) + labs(title="교통사고안전등급") + 
  theme(plot.title=element_text(hjust=0.5))+
  scale_fill_gradientn(colours=c('white', 'orange', 'red'))+
  expand_limits(x=map$long, y=map$lat) + coord_fixed() +
  theme(axis.ticks=element_blank(), axis.text.y=element_blank()) + 
  theme(axis.ticks=element_blank(), axis.text.x=element_blank())+
  xlab("") + ylab("") +xlim(80000, 750000)

ggplot(safety, aes(map_id=region, fill=화재))+
  geom_map(map=map, alpha=0.5, colour='white', size=0.0) +
  theme(legend.position='right')+ 
  scale_fill_gradientn(colours=c('yellow', 'red'))+
  labs(title="화재안전등급")+
  theme(plot.title=element_text(hjust=0.5))+
  expand_limits(x=map$long, y=map$lat) + coord_fixed()+
  theme(axis.ticks=element_blank(), axis.text.y=element_blank())+ 
  theme(axis.ticks=element_blank(), axis.text.x=element_blank())+ 
  xlab("")+ylab("")+xlim(80000, 700000)

young_d <- read.csv('data_seoul_child.csv', header=T)
head(young_d)
map_seoul <- read.csv('mapv2_final_seoul.csv', header=T)
head(map_seoul)
head(subset(map_seoul, 시군구명=='금천구'))

pro.list <- names(table(map_seoul$시군구명))
xx <- vector(); yy <- vector()
for (jj in 1:length(pro.list)){
  xx[jj] <- mean(subset(map_seoul, 시군구명==pro.list[jj])$long)
  yy[jj] <- mean(subset(map_seoul, 시군구명==pro.list[jj])$lat)
}
tab.x.y <- cbind(pro.list, xx, yy)
head(tab.x.y)
data5 <- young_d[sort.int(young_d[ ,1], index.return = T)$ix, ]
head(data5)

ggplot(young_d, aes(map_id=region, fill=영유아보육시설))+
  geom_map(map=map_seoul, alpha=0.3, colour='white', size=0.1)+
  theme(legend.position=c(0.1, 0.8))+
  scale_fill_gradientn(colours=c('yellow', 'red'))+
  expand_limits(x=map_seoul$long, y=map_seoul$lat)+
  coord_fixed()+labs(x="", y="", title="영유아보육시설")+
  theme(plot.title=element_text(hjust=0.5))+
  theme(axis.ticks=element_blank(), axis.text.y=element_blank())+
  theme(axis.ticks=element_blank(), axis.text.x=element_blank())+
  geom_text(x=xx, y=yy+400, label=data5$영유아보육시설, size=3, col=4)+
  geom_text(x=xx, y=yy-600, label=pro.list, size=3, col=1)

# 2-네트워크 그림
library(igraph)
split.screen(figs=c(1,2))
screen(1)
g1 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=3, directed=F)
plot(g1)
screen(2)
g1 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=3, directed=T)
plot(g1)

split.screen(figs=c(1,2))
screen(1)
g1 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=3)
plot(g1, edge.arrow.size=0.5)
screen(2)
g2 <- graph(edges=c(1, 2, 2, 3, 3, 1), n=7)
plot(g2, edge.arrow.size=0.5)

g3 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul"))
plot(g3)

g4 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul", "Seoul", "Daegu", "Seoul", "daejeon"), isolates=c("Sejong", "Ulsan"))
plot(g4, edge.arrow.size=1.5, vertex.color="gold", 
     vertex.size=15, vertex.frame.color="grey", 
     vertex.label.color="black", vertex.label.cex=1.2, 
     vertex.label.dist=2, edge.curved=0.2)

g4 <- graph(c("Seoul", "Busan", "Busan", "Gwangju", "Gwangju", "Seoul", "Seoul", "Daegu", "Seoul", "daejeon"), 
            isolates=c("Sejong", "Ulsan"))
E(g4)
V(g4)$name
V(g4)$Type <- c("Special", "Metropolitan", "Metropolitan", "Metropolitan", "Metropolitan", "Multi-functional Administrative", "Metropolitan")
V(g4)$Pop <- c(9.7, 3.4, 5.5, 2.4, 1.5, 4.27, 2.1)
V(g4)$Type
E(g4)$traffic_volume <-c(2.8, 4.5, 8.7, 5.64, 4.9)
E(g4)$traffic <- c('train', 'plane', 'train', 'highway', 'highway')
E(g4)$type <- c('business', 'business', 'business', 'travel', 'travel')

plot(g4, edge.arrow.size=1.5, 
     vertex.label.color="black", vertex.label.dist=2, 
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"), 
     edge.curved=0.2)

plot(g4, edge.arrow.size=1.5, 
     vertex.label.color="black", vertex.label.dist=2, 
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"), 
     edge.curved=c(0.1, 0.9, 0.3, 0.4, 0.1))

plot(g4, edge.arrow.size=1.5, 
     vertex.size=30, vertex.frame.color="grey", 
     vertex.label.color="black", 	vertex.label.cex=1.2, 
     vertex.label.dist=3.5, edge.curved=0.2, 
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))

(E(g4)$width <- E(g4)$traffic_volume/2)
plot(g4, edge.arrow.size=1, vertex.size=V(g4)$Pop*4, 
     vertex.frame.color="grey", vertex.label.color="black",
     vertex.label.cex=1.2, vertex.label.dist=3.5, edge.curved=0.2,
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))

te <- c('train', 'plane', 'train', 'highway', 'highway')
line.col <- ifelse(te=='train', 1, ifelse(te=='plane', 2, 3))
colrs <-c("black", "maroon", "blue")
plot(g4, edge.color=colrs[line.col], vertex.size=V(g4)$Pop*4,
     vertex.frame.color="grey", vertex.label.color="black",
     vertex.label.cex=1.2, vertex.label.dist=3.5, edge.curved=0.2,
     vertex.color=c("pink", rep("skyblue", 4), "peru", "skyblue"))

line.curve <- c(0.1, 0.9, 0.3, 0.4, 0.1)
mycolrs <- c("gold", rep("tomato", 4), "lightpink", "tomato")
plot(g4, edge.color=colrs[line.col], vertex.size=V(g4)$Pop*6, 
     vertex.frame.color="grey", vertex.label.color="black",
     vertex.label.cex=1.2, edge.curved=line.curve, vertex.color=mycolrs)
legend('topleft', c("Special", "Metropolitan", "Metropolitan Autonomous"), 
       pch=21, pt.bg=c("gold", "tomato", "lightpink"), pt.cex=2, bty='n', ncol=1)
legend(x=-1.5, y=-1.5, c('train', 'plane', 'highway'), lty=1, lwd=2, 
       col=colrs, bty='n', ncol=3)

# ----- 2017년 기말 기출문제 -----

# 24번
score <- c(0.9, 0.8, 0.9, 0.9, 0.8, 0.9, 0.7, 0.8, 0.8, 0.8, 0.7, 0.7, 0.7, 0.8, 0.5, 0.5, 0.6, 0.9, 0.6, 0.4)
n <- c("Kim", "Lee", "Park", "Choi")
c <- c("통계학", "전산학", "경영학", "영어", "체육")
names <- list(vec1=n, vec2=c) 
score1 <- matrix(score, nrow=4, byrow=T, dimnames = names)
score.table <- as.data.frame(score1)

stars(score.table, frame.plot = TRUE, 
      scale = FALSE, radius = FALSE, draw.segments = FALSE, full = TRUE)

# 25번
sample_func <- function(x){
  3*x^3-5*x^2+8*x+25
}
is.function(sample_func)

optimize(sample_func, interval = c(-5, 5))