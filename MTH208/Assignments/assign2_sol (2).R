
################ my code ############
my.prop.color <- function(img, col)
{
  col.mat <- as.array(img[,,1,])
  dims <- dim(col.mat)
  
  dist <- matrix(0, nrow = dims[1], ncol = dims[2])
  for(i in 1:dims[1])
  {
    for(j in 1:dims[2])
    {
      dist[i,j] <- norm(col.mat[i,j, ] - col, "2")
    }
  }
  
  props <- sum(dist < .5)/(dims[1]*dims[2])
  return(props)
}

###################################
