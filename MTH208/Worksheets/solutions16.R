#######################################
### Solutions to Worksheet 16
#######################################
library(profvis)
library(rbenchmark)
library(imager)


## Problem 1
profvis({
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
  att_vec <- replicate(1e4, attempts(25))
})
# Replicate calls function sapply in the background.


## Problem 2
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

reps <- 1e3
benchmark(replicate(reps, attempts(25)),
  {  
    att_vec <- numeric(length = reps)
  for(i in 1:reps)
  {
    att_vec[i] <- attempts(25)
  }}, 
  replications  = 100)
# Almost the same looks like

## Problem 3
reps <- 1e4
benchmark(replicate(reps, attempts(25)),
          {  
            att_vec <- numeric(length = reps)
            for(i in 1:reps)
            {
              att_vec[i] <- attempts(25)
            }}, 
          replications  = 20)
# Almost the same looks like

## Problem 4
reps <- 1e4
benchmark({
  att_vec <- NULL
  for(i in 1:reps)
  {
    att_vec <- c(att_vec, attempts(25))
  }},
  {  att_vec <- numeric(length = reps)
  for(i in 1:reps)
  {
    att_vec[i] <- attempts(25)
  }}, 
  replicate(reps, attempts(25)), 
  replications  = 25)


## Problem 5
profvis({
  dog <- load.image("dog.jpeg")  # make sure this is in your working directory
  col.mat <- as.array(dog[, ,1, ])
  
  dims <- dim(col.mat)
  rot <- array(0, dim = dims)
  
  for(i in 1:dims[1])
  {
    for(j in 1:dims[2])
    {
      rot[i, j, ] <- col.mat[dims[1] - i + 1, dims[2] - j + 1, ]
    }
  }
})


# Alternative code
profvis({
  dog <- load.image("dog.jpeg")
  dims <- dim(dog)
  rot <- dog[dims[1]:1, dims[2]:1, ]
})

# Benchmarking
benchmark({
  dog <- load.image("dog.jpeg")  # make sure this is in your working directory
  col.mat <- as.array(dog[, ,1, ])
  
  dims <- dim(col.mat)
  rot <- array(0, dim = dims)
  
  for(i in 1:dims[1])
  {
    for(j in 1:dims[2])
    {
      rot[i, j, ] <- col.mat[dims[1] - i + 1, dims[2] - j + 1, ]
    }
  }
},
{
  dog <- load.image("dog.jpeg")
  dims <- dim(dog)
  rot <- dog[dims[1]:1, dims[2]:1, ]
}, replications = 20)
# second code is much faster!

## Problem 6
n <- 1e4
m <- 1e4
A <- matrix(runif(n*m), ncol = m, nrow = n)
benchmark(colMeans(A), apply(A, 2, mean), replications = 10)
# takes some time, colMeans is ~ 15 times faster!!

