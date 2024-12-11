#include <Rcpp.h>
#include <BigInt.hpp>

using namespace Rcpp;

// const BigInt Factorial(int element)
const int Factorial(int element)
{
  // BigInt result = 1;
  int result = 1;

  for (int i = 1; i <= element; i++)
  {
    result = result * i;
  }

  return result;
}

// [[Rcpp::export]]
String largestFactorial(int element)
{
//  BigInt result = Factorial(element);
//
//  return result.to_string();
  int result = Factorial(element);

  return std::to_string(result);
}