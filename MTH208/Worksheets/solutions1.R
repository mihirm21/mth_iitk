### Worksheet 1

## Problem 1
# We can also add conditions
# for only positive integers
fact <- function(n)
{
  track <- 1
  for(i in 1:n)
  {
    track <- track * i
  }
  return(track)
}


## Problem 2
euler <- function(n)
{
  nlim <- (1 + 1/n)^(n)
  return(nlim)
}
euler(3)
# checking comparisons with e
euler(10000) - exp(1)


## Problem 3
seat <- read.csv("https://dvats.github.io/assets/course/mth208/seating.csv")

# suppose by roll no. is 221332
seat[seat$Roll == 221332, ]

## Problem 4
# make sure seating.csv is downloaded 
# to your working directory
# use getwd() to find your working directory
seat <- read.csv("seating.csv")



