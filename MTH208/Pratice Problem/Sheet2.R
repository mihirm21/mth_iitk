#Problem1

odd <- seq(1, by = 2 , length.out = 1000)

#Problem2

fib <- numeric(500)
fib[1] <- fib[2] <- 1

for(i in 3:500)
{
  fib[i] <- fib[i-1] + fib[i-2]
}

#Problem3

even <- function()
{
  if(sample(x = 1:6 , size = 1) %% 2 ==0)
    return(1)
  else
    return(0)
}

#Problem4

result <- function(n)
{
  if(n %% 2 ==0)
    for_win = (n/2) + 1
  else
    for_win = (n+1) / 2
  
  count_head = 0
  count_tail = 0
  
  for(i in 1:n)
  {
    count_head = count_head + rbinom(1 , 1 , 0.5)
  }
  
  if(count_head >= 8)
    print("Win")
  else
    print("Loss")
}

result(15)

#Problem5

array(1, dim = c(5,5))
matrix(1,nrow =5 , ncol =5)

#Problem6

diag( 1:5 )

#Problem7

dice_num = numeric(100)
for( i in 1:100 )
  dice_num[i] = sample( 1:6 , size = 1)

array( dice_num , dim = c(10,10) )

#Problem8

n = 2
rho = 5

mat = matrix( 1 , ncol = n , nrow = n )
diag(mat) = rho

mat

#Problem9

n = 2
rho = 3

mat = matrix( 0 , ncol = n , nrow = n )

mat

#Problem10

odd.mat <- function(mat1)
{
  return(mat1(col(mat1) %% 2 == 1))
}
test.mat = array( data = 1:16 , dim = c(4,4))
odd.mat(test.mat)

#Problem 6

days = 0
tablet.full = 100
tablet.half = 0
count = 1
while(count)
{
  count = rbinom(n = 1 ,size = 1 , prob = tablet.full/(tablet.full + tablet.half))
  if(count)
  {
    tablet.full = tablet.full - 1
    tablet.half = tablet.half + 1
    days = days + 1
  }
  
  else
  {
    count = 0
  }
    
}









































