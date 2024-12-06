### Solutions to Worksheet 3 ###

#########################################
## Problem 1
# 1(a)
# 1000 tosses of a coin
tosses <- rbinom(n = 1e3, size = 1, prob = 0.50)
sum(tosses)/1000  # proportion of heads
# can also do this
mean(tosses)

# 1(b)
# 1000 tosses of a coin
tosses <- rbinom(n = 1e3, size = 1, prob = 0.30)
mean(tosses)  # proportion of heads


#########################################
## Problem 2
# 2(a)
# suppose 1 = red, 2 = green, 3 = blue
sample(1:3, size = 1, prob = c(3,2,2)/7)

# 2(b)
A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)

# p_vec will store p_i eventually
p_vec <- numeric(length = 3)

# running a loop for each column
# to find the norm (the numerator)
for(k in 1:ncol(A))
{
  p_vec[k] <- norm(A[ ,k], type = "2")
}
# divide by the sum
p_vec <- p_vec/sum(p_vec)

sample(1:3, size = 1, prob = p_vec)


#########################################
## Problem 3
# 3(a)
attempts <- function()
{
  sums <- 0
  count <- 0
  while(sums <= 1)
  {
    sums <- sums + runif(n = 1, min = 0, max = 1)
    count <- count + 1
  }
  return(count)
}
attempts()

# 3(b)
att_vec <- numeric(length = 1e3)
for(i in 1:1e3)
{
  att_vec[i] <- attempts()
}

# 3(c)
mean(att_vec)



#########################################
## Problem 4

# function that calculates number of blows
# 4(a)
attempts <- function(age)
{
  count <- 0
  remain <- age # age no. of candles remain in the beginning
  while(remain > 0)
  {
    count <- count + 1
    
    # randomly choose any number between 1 and remain
    blow_out <- sample(1:remain, size = 1)
    remain <- remain - blow_out
  }
  
  return(count)
}
attempts(age = 25)

# 4(b)
att_vec <- numeric(length = 1e3)
for(i in 1:1e3)
{
  att_vec[i] <- attempts(25)
}

# 4(c)
mean(att_vec)


# 4(d)
att_vec <- numeric(length = 1e3)
for(i in 1:1e3)
{
  att_vec[i] <- attempts(30)
}
mean(att_vec)