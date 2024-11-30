#include <Rcpp.h>
#include <BigInt.hpp>

using namespace Rcpp;

// [[Rcpp::export]]
const String Fibonacci__(long unsigned int limit)
{
  BigInt n_1 = 1;
  BigInt n_2 = 1;
  BigInt n = n_1 + n_2;
  long unsigned int index = 0;

  if (1 == limit || 2 == limit) {
    return '1';
  }

  if (3 == limit) {
    return '2';
  }

  for (index = 4; index <= limit; index++)
  {
    n_1 = n_2;
    n_2 = n;
    n = n_1 + n_2;
  }

  return n.to_string();
}

// [[Rcpp::export]]
const int problem25CPP(long unsigned int limit)
{
  BigInt n_1 = 1;
  BigInt n_2 = 1;
  BigInt n = n_1 + n_2;
  long unsigned int index = 0;

  if (1 == limit || 2 == limit) {
    return '1';
  }

  if (3 == limit) {
    return '2';
  }

  for (index = 4; n.to_string().length() < limit; index++)
  {
    n_1 = n_2;
    n_2 = n;
    n = n_1 + n_2;
  }

  return index - 1;
}