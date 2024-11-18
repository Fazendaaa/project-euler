#include <Rcpp.h>

using namespace Rcpp;

const std::list<int> getDivisors(int number) {
  int limit = floor(sqrt(number)), tmp = 0;
  std::list<int> divisors = {1};

  if (1 != number) {
    for (int index = 2; index <= limit; index += 1) {
      if (0 == number % index) {
        divisors.push_back(index);

        tmp = number / index;

        if (tmp != index) {
          divisors.push_back(tmp);
        }
      }
    }

    divisors.sort();
    divisors.push_back(number);
  }

  return divisors;
}

const bool isAbundant(int number) {
  int sum = 0;
  std::list<int> divisors = getDivisors(number);

  divisors.pop_back();

  for (auto i: divisors) {
    sum += i;
  }

  return sum > number;
}

const std::list<int> getAbundantNumbers(int limit) {
  std::list<int> abundantNumbers = {};

  for (int index = 1; index < limit; index += 1) {
    if (isAbundant(index)) {
      abundantNumbers.push_back(index);
    }
  }

  return abundantNumbers;
}

// [[Rcpp::export]]
double problem23Cpp() {
  int limit = 28123, sum = 0, total = 0;
  std::list<int> allAbundant = getAbundantNumbers(limit);
  std::vector<bool> sumOfTwo;

  sumOfTwo.reserve(limit);

  for (int index = 0; index <= limit; index+= 1) {
    sumOfTwo.push_back(false);
  }

  for (auto outer: allAbundant) {
    for (auto inner: allAbundant) {
      sum = outer + inner;

      if (sum > limit) {
        break;
      }

      sumOfTwo.at(sum) = true;
    }
  }

  for (int index = 1; index <= limit; index+= 1) {
    if (false == sumOfTwo.at(index)) {
      total += index;
    }
  }

  return total;
}