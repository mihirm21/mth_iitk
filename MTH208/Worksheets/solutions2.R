### Solutions to Worksheet 2 ###

## Problem 1
seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")

# MSc students have id 22xxxx, so all MSc students
# have roll number > 220000
msc <- seat[seat$Roll > 220000, ]  #  data of only msc students
length(msc$Roll)  


## Problem 2
cricket <- read.csv("https://dvats.github.io/assets/course/mth208/battingbowling.csv")


## Problem 2(a)
allround_index <- (cricket$Batting > 25 & cricket$Bowling < 40)
allround <- cricket[allround_index, ]

# presents the frequencies of all teams
table(allround$Team)

# NZ is largers, SA is smallest


## Problem 3
plot(x = 1:10, y = 1:10, type = "l", xlab = "x", ylab = "y", main = "Y = X Plot")


## Problem 4
# Making a function for (1 + 1/n)^n
fx <- function(n)
{
  rtn <- (1 + 1/n)^n
  return(rtn)
}

# defining a vector of n = 1, ..., 1000
n <- 1:1e3

# calculating fn for each n
# function is easily vectorizable
fn <- fx(n)

# making a plot
plot(n, fn, type = "l")
abline(h = exp(1), col = "red")
