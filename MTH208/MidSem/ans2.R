library(imager)

# An imager image is taken as input
flip <- function (img){
  # Convert the image pixel and color values into an array
  orig.img.arr <- as.array(img[, , 1, ])
  
  # Create an empty array to contain values of new image
  new.img.arr <- array(0, dim = dim(orig.img.arr))
  
  # The following loop fills the new image array
  img.dims <- dim(orig.img.arr)
  for (i in 1:img.dims[1]){
    for (j in 1:img.dims[2]){
      for (k in 1:img.dims[3]){
        new.img.arr[i, j, k] <- orig.img.arr[img.dims[1] + 1 - i, j, k]
      }
    }
  }
  
  # Create an imager image from the array and return it
  new.img <- as.cimg(new.img.arr)
  return(new.img)
}
