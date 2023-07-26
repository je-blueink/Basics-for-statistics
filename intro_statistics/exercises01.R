# 1번 문제
score<-c(88,83,83,85,94,88,91,96,89,83,81,80,84,89,83,79)
hist(score, breaks = 5, main = "Test scores of Statistics", xlab = "Score", ylab = "Frequency")
boxplot(score, ylab="Score")
fivenum(score)

# 2번 문제
dat1<-c(25,41,35,8,52,23,32,37,42,28)
t.test(dat1, mu=25, alternative =  "two.sided")

# 3번 문제
before <- c(80,56,49,82,70)
after <- c(76,55,52,79,72)
t.test(before, after, alternative="greater", paired=T)

# 4번 문제

a <- c(269,196,254,226,215,228,251,217,260,240,NA)
b <- c(320,281,336,303,294,354,315,259,NA,NA,NA)
c <- c(283,268,357,325,288,295,272,245,275,246,341)
X <- c(a,b,c)
Y <- c(rep(1,11), rep(2,11), rep(3,11))
Y <- factor(Y)
aovdat1 <- data.frame(X,Y)
aovmodel1 <- aov(X~Y, data = aovdat1)
summary(aovmodel1)

# 5번 문제

vacc <- matrix(c(12,18,15,15), nrow = 2)
chisq.test(vacc, correct = F)

# 6번 문제

bf <- c(72,80,83,63,66,76,82)
af <- c(78,82,82,68,70,75,88)

cor(bf,af)
achieve <- lm(af~bf)
summary(achieve)
plot(bf, af)
abline(achieve)