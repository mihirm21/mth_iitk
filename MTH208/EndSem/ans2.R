library(Rcpp)

sourceCpp(file = "Cans2.cpp")

sel_sums <- function(mat){
  # Obtaining the size of the square matrix
  p = dim(mat)[1]
  
  # Randomly choosing a number s between 1 and p (inclusive)
  s = sample(1:p, size = 1)
  
  # Calling the sourced C++ function
  return(sumsC(mat, s))
}
