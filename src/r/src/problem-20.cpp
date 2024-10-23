#include <Rcpp.h>
#include "BigInt.hpp"

using namespace Rcpp;

const BigInt Factorial(int element)
{
  BigInt result = 1;

  for (int i = 1; i <= element; i++)
  {
    result = result * i;
  }

  return result;
}

// [[Rcpp::export]]
String largestFactorial(int element)
{
  BigInt result = Factorial(element);

  return result.to_string();
}
