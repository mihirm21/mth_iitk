# 'n' is the number of people in the room
# The function returns TRUE when 2 people share the same birthday
birthday <- function (n){
  # Getting the random birthdays of people in the room
  bdates <- sample(1:365, size = n, replace = TRUE)
  
  # Taking a vector containing unique birthdays
  uniq_dates <- unique(bdates)
  
  # Checking whether all birthdays are unique or not
  if (length(bdates) != length(uniq_dates)){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

outcomes25 <- replicate(1000, birthday(25))
ans25 <- length(outcomes25[outcomes25]) / 1000

outcomes50 <- replicate(1000, birthday(50))
ans50 <- length(outcomes50[outcomes50]) / 1000
