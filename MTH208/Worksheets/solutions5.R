#######################################
## Worksheet 5 Solutions ##############
#######################################

library(imager)

##############################
# Problem 1
# 180 deg means that n x m remains n x m
# and directions are flipped
dog <- load.image("dog.jpeg")
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

# Let's plot size by side
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(rot))



##############################
# Problem 2
# 90 deg means that n x m becomes m x n
# and then appropriate rotation
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])

dims <- dim(col.mat)
rot <- array(0, dim = c(dims[2], dims[1], dims[3]))

for(i in 1:dims[1])
{
  for(j in 1:dims[2])
  {
    # i component becomes j
    rot[j, i, ] <- col.mat[i, dims[2] - j + 1, ]
  }
}

# Let's plot size by side
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(rot))




##############################
# Problem 3
# 90 deg means that n x m becomes m x n
# and then appropriate rotation
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])

dims <- dim(col.mat)
rot <- array(0, dim = c(dims[2], dims[1], dims[3]))

for(i in 1:dims[1])
{
  for(j in 1:dims[2])
  {
    # i component becomes j
    rot[j, i, ] <- col.mat[dims[1] - i + 1, j, ]
  }
}

# Let's plot size by side
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(rot))




##############################
# Problem 4
# 90 deg means that n x m becomes m x n
# and then appropriate rotation
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])

dims <- dim(col.mat)
rot <- array(0, dim = c(dims[2], dims[1], dims[3]))

for(i in 1:dims[1])
{
  for(j in 1:dims[2])
  {
    # i component becomes j
    rot[j, i, ] <- col.mat[dims[1] - i + 1, j, ]
  }
}

# Let's plot size by side
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(rot))




##############################
# Problem 5

# cropping image first
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])
col.mat <- col.mat[1:600, 1:600, ]

reduce <- array(0, dim = c(300, 300, 3))
red.dims <- dim(reduce)

# I will take an average of the 2 by 2 pixels
# and then assign the average value to the reduce
averaging <- rep(0,3)
for(i in 1:red.dims[1])
{
  for(j in 1:red.dims[2])
  {
    ind1 <- (2*(i-1) + 1): (2*i)
    ind2 <- (2*(j-1) + 1): (2*j)
    
    # taking the average rbg in the 2 by 2 area
    averaging[1] <- mean(col.mat[ind1, ind2, 1])
    averaging[2] <- mean(col.mat[ind1, ind2, 2])
    averaging[3] <- mean(col.mat[ind1, ind2, 3])
    
    reduce[i, j, ] <- averaging
  }
}
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(reduce))
save.image(as.cimg(reduce), file = "dog_300.jpeg")


##############################
# Problem 5

# cropping image first
dog <- load.image("dog.jpeg")
col.mat <- as.array(dog[, ,1, ])
col.mat <- col.mat[1:600, 1:600, ]

reduce <- array(0, dim = c(60, 60, 3))
red.dims <- dim(reduce)

# I will take an average of the 10 by 10 pixels
# and then assign the average value to the reduce
averaging <- rep(0,3)
for(i in 1:red.dims[1])
{
  for(j in 1:red.dims[2])
  {
    ind1 <- (10*(i-1) + 1): (10*i)
    ind2 <- (10*(j-1) + 1): (10*j)
    
    # taking the average rbg in the 10 by 10 area
    averaging[1] <- mean(col.mat[ind1, ind2, 1])
    averaging[2] <- mean(col.mat[ind1, ind2, 2])
    averaging[3] <- mean(col.mat[ind1, ind2, 3])
    
    reduce[i, j, ] <- averaging
  }
}
par(mfrow = c(1,2))
plot(dog)
plot(as.cimg(reduce))
save.image(as.cimg(reduce), file = "dog_60.jpeg")