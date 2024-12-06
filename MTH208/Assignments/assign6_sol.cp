// cope and paste your code here.

#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
NumericMatrix my_divideC(NumericMatrix x, NumericMatrix y) {
  int n = x.nrow();
  int m = x.ncol();
  
  NumericMatrix out(n,m);
  
  for(int i = 0; i < n; i++)
  {
    for(int j = 0; j < m; j++)
    {
      out(i,j) = x(i,j) / y(i,j); 
    }
  }
  return out;
}
