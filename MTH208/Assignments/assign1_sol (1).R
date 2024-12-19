
################ my code ############
my.tennis <- function(p)
{
  
  # will track number of wins for A and B
  A <- 0
  B <- 0
  for(k in 1:5)
  {
    next.game <- sample(0:1, size = 1, prob = c(p, 1-p))
    if(next.game == 0) B <- B+1
    if(next.game == 1) A <- A+1
    
    # best-of-series finishes when any team reaches 3
    if(A == 3 || B == 3)
    {
      x <- k 
      break
    }
  }  
  return(x)
}


my.matches <- numeric(length = 1e3)
for(i in 1:1e3)
{
	my.matches[i] <- my.tennis(.7)
}

ans <- mean(my.matches)
ans

###################################
