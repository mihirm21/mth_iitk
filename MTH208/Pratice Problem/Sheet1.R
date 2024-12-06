# Question1


radius <- as.integer(readline("Enter the value of radius of circle : "))
area <- function(radius)
{
  return( pi * radius * radius )
}

cat("Area of the circle of radius" , radius , "is" , area(radius))


#Question 2

first_num <- as.integer(readline("Enter the first number : "))
sec_num <- as.integer(readline("Enter the second number : "))

if( first_num == sec_num){
  cat(first_num , "and" , sec_num , "both are equal")
} else if ( first_num < sec_num ){
  cat(sec_num , "is greater than" , first_num )
} else if ( first_num > sec_num ){
  cat(first_num , "is greater than" , sec_num)
}

#Question 3

dice_num <- numeric(1000)
even_count <- 0

for(i in 1:1000)
{
  dice_num[i] <- sample(x =  1:6 , size = 1 )
  if(dice_num[i] %%  2 == 0)
  {
    even_count = even_count + 1
  }
}
cat("Numner of even count is" , even_count)

#Question 4

ran_num <- numeric(1000)
ran_num = runif( n <- 1000 , min <- 0 , max <- 1 )
cat("Number between 0.1 and 0.2 is" , length(subset(ran_num , ran_num > 0.1 & ran_num < 0.2)))


#Question 5


num_count <- function()
{
  i <- 1
  prob_toy <- numeric(100)
  while(length(unique(prob_toy)) != 8 & i <= 50 )
  {
    prob_toy[i] <- sample(x = c('Harry', 'Dumbledore', 'Hermione', 'Ron', 'Neville', 'Mcgonagall', 'Dobby'), size <- 1 ,replace = FALSE, prob <- c(.25, .20, .20, .15, .10, .05, .05) )
    i = i + 1
  }
  #print(prob_toy)
  
  return(i)
}

num_count_vector <- numeric(1000)
for(i in 1:1000)
{
  num_count_vector[i] <- num_count()
}

#num_count_vector
cat("To collect all toys average number of packet bought is" , mean(num_count_vector))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  