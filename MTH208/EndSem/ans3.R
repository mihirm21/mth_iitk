load("ques3.Rdata")

# Size of the square matrix
p <- dim(mat)[1]

# Eigenvalues of the matrix
eigen.values <- eigen(mat, only.values = TRUE)$values

# Declaring the log of the answer
log.ans <- 0

# Adding sum terms obtained on logarithm
log.ans <- log.ans + (p * log(2.7)) - (p * log(p)) + sum(log(1:p))

# Adding the logarithm of the determinant term
log.ans <- log.ans + ((1/p) * sum(log(eigen.values)))

# Adding (effectively subtracting) the logarithm of the trace term
log.ans <- log.ans - log(sum(eigen.values))

ans <- exp(log.ans)
