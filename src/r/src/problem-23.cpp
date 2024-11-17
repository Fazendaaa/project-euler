#include <Rcpp.h>
#include <algorithm>

using namespace Rcpp;

const std::list<int> getDivisors(int number) {
  int limit = floor(sqrt(number)), tmp;
  std::list<int> divisors = {1};

  if (1 == number) {
    return divisors;
  }

  for (int index = 2; index < limit; index += 1) {
    if (0 == number % index) {
      divisors.push_back(index);

      tmp = floor(number / index);

      if (tmp != index) {
        divisors.push_back(tmp);
      }
    }
  }

  divisors.sort();

  return divisors;
}

const bool isAbundant(int number) {
  int sum = 0;
  std::list<int> elements = getDivisors(number);

  for (auto i : elements) {
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
  int limit = 28123, sum, total, start = 1;
  std::list<int> allAbundant = getAbundantNumbers(limit);
  std::list<int> sumOfTwo = {};

  for (auto i: getDivisors(100)) {
    Rcout << i << ' ';
  }

  for (auto outer: allAbundant) {
    for (auto inner: allAbundant) {
      sum = outer + inner;

      if (sum > limit) {
        break;
      }

      sumOfTwo.push_back(sum);
    }
  }

  sumOfTwo.sort();
  sumOfTwo.unique();

  for (int index = 1; index <= limit; index++) {
    if (std::find(sumOfTwo.begin(), sumOfTwo.end(), index) == sumOfTwo.end()) {
      total += index;
    }
  }

  return total;
}