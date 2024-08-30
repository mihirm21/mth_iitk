# Loading numerical part of data
dat <- read.csv("LowRepeated.csv", skip = 5, header = FALSE)

# loading other parts of data
demo <- read.csv("LowRepeated.csv", nrows = 5, header = FALSE)

# generic plot
plot(dat[,1], dat[,2], type = 'l',
     xlab = "Wavelength", lwd = 2,
     ylab = "Reflectance")

# extracting dates, times, and variety
dates <- as.factor(demo[1, -1])
variety <- as.factor(demo[5, -1])
times <- as.factor(demo[2, -1])

# making all 4 plots
par(mfrow = c(2,2))
plot(dat[,1], dat[,2], type = "n", 
     ylab = "Reflectance", xlab = "Wavelength")
for(k in 2:ncol(dat))
{
  lines(dat[,1], dat[,k], col = 1)
}


plot(dat[,1], dat[,2], type = "n", 
     ylab = "Reflectance", xlab = "Wavelength")
for(k in 2:ncol(dat))
{
  lines(dat[,1], dat[,k], col = dates[k-1])
}
legend("topleft", col = c(1,2), legend = levels(dates), lty = 1)


plot(dat[,1], dat[,2], type = "n", 
     ylab = "Reflectance", xlab = "Wavelength")
for(k in 2:ncol(dat))
{
  lines(dat[,1], dat[,k], col = times[k-1])
}
legend("topleft", col = 1:length(levels(times)), legend = levels(times), lty = 1)


plot(dat[,1], dat[,2], type = "n", 
     ylab = "Reflectance", xlab = "Wavelength")
for(k in 2:ncol(dat))
{
  lines(dat[,1], dat[,k], col = variety[k-1])
}
