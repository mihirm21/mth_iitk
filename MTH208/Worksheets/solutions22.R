#######################################
## Solutions to Worksheet 22
#######################################

## Problem 7
library(MASS)
data(accdeaths)

# plot is made in a proper axis
plot(accdeaths, ylab = "Accidental Deaths")


## Problem 8

# old plot
data(anorexia)
hist(anorexia$Postwt, xlab = "Weight", ylim = c(0, 30),
     main = "Histogram of Weights")
hist(anorexia$Prewt, add = TRUE,
     col = adjustcolor("blue", alpha.f = .3))
legend("topright", legend = c("After", "Before"),
       fill = c("grey", adjustcolor("blue", alpha.f = .3)))

# new plot. I choose to make a boxplot
# of the differences, as a function of
# the treatments. 
boxplot(anorexia$diff ~ anorexia$Treat,
     xlab = "Treatment", ylab = "Difference in Weights")

