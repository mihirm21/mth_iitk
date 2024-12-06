### Solution to assignment 7

dat <- read.csv("data.csv")
dat$X1 <- as.factor(dat$X1)
dat$X2 <- as.factor(dat$X2)
dat$X3 <- as.factor(dat$X3)

## X2 is the variable that separates Var1 and Var2
## into 3 visible groups

plot(dat$Var1, dat$Var2, col = dat$X2, 
  xlab = "Variable 1", ylab = "Variable 2", 
  main = "Simpson's Paradox with X2", pch = 16)
for(i in 1:length(levels(dat$X2)))
{
  foo <- subset(dat, dat$X2 == levels(dat$X2)[i])
  abline(lm(foo$Var2 ~ foo$Var1), col = i)
}
legend("topleft", legend = levels(dat$X2), 
  title = "X2", fill = 1:3)