#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
NumericVector sumsC(NumericMatrix x, int s)
{
  // Declaring the output vector
  NumericVector colSum(s);
  
  // Filling the output vector with zeros
  for (int i = 0; i < s; i++)
  {
    colSum[i] = 0;
  }
  
  // Calculating the column sums
  for (int i = 0; i < x.nrow(); i++)
  {
    for (int j = 0; j < s; j++)
    {
      colSum[j] = colSum[j] + x(i, j);
    }
  }
  
  return colSum;
}
