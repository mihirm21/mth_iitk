autoreg_fast <- function(n, rho)
{
  # Allocating space to the out vector beforehand
  out <- numeric(length = n)
  
  # A slight improvement was observed when calculating
  # the random values at once
  errors <- rnorm(n - 1)
  
  # Doing the required calculations
  out[1] <- 0
  for(t in 2:n)
  {
    error <- errors[t-1]
    error <- rho*out[t-1] + error
    out[t] <- error
  }
  
  return(out)
}
