
#######################################
### Solutions to Worksheet 20
#######################################

## Problem 1
dat <- read.csv("auto-mpg.csv")
head(dat)

cor(dat$mpg, dat$acceleration)


## Problems 2 and 3

# as acceleration increases, mpg increases
# does this agree with your understanding of cars?
plot(dat$acceleration, dat$mpg, pch = 16,
     xlab = "Acceleration", ylab = "Miles Per Gallon")
abline(lm(dat$mpg ~ dat$acceleration))

plot(dat$acceleration, dat$mpg, pch = 16,
     col = dat$cylinders,
     xlab = "Acceleration", ylab = "Miles Per Gallon")

for(i in unique(dat$cylinders))
{
  foo <- subset(dat, dat$cylinders == i)
  abline(lm(foo$mpg ~ foo$acceleration), col = i)
}
legend("topleft", col = unique(dat$cylinders), 
       legend = unique(dat$cylinders), pch = 16,
       title = "Cylinders")


## Problem 5
head(iris)
plot(iris$Sepal.Length, iris$Sepal.Width, 
     xlab = "Sepal Length", ylab = "Sepal Width",
     pch = 16)
abline(lm(iris$Sepal.Width ~ iris$Sepal.Length))


# Simpson's paradox here
plot(iris$Sepal.Length, iris$Sepal.Width, 
     xlab = "Sepal Length", ylab = "Sepal Width",
     pch = 16, col = iris$Species)

for(i in 1:length(levels(iris$Species)))
{
  level <- levels(iris$Species)[i]
  foo <- subset(iris, iris$Species == level)
  abline(lm(foo$Sepal.Width ~ foo$Sepal.Length), col = i)
}


### Problem 6
dat <- read.csv("fire-dat.csv")
cor(dat$firefight, dat$injured)  # highly positively correlated
plot(dat$firefight, dat$injured)



### Problem 7
dat <- read.csv("fire-intense.csv")
cor(dat) # highly positively correlated everywhere
plot(dat)






