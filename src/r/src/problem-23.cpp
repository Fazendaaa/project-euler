#include <Rcpp.h>

using namespace Rcpp;

const std::list<int> getDivisors(int number) {
  int limit = number/2;
  std::list<int> divisors = {1};

  for (int index = 2; index <= limit; index += 1) {
    if (0 == number % index) {
      divisors.push_back(index);
    }
  }

  divisors.push_back(number);

  return divisors;
}

const bool isAbundant(int number) {
  int sum = 0;
  std::list<int> elements = getDivisors(number);

  elements.pop_back();

  for (auto i : elements) {
    sum += i;
  }

  return sum > number;
}

const std::list<int> getAbundantNumbers(int limit) {
  std::list<int> abundantNumbers = {};

  for (int index = 1; index <= limit; index += 1) {
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
  auto outerValue = allAbundant.begin(), innerValue = allAbundant.begin();

  for (int outerIndex = 0; outerIndex < allAbundant.size(); outerIndex += 1) {
    std::advance(outerValue, outerIndex);

    for (int innerIndex = outerIndex; innerIndex < allAbundant.size(); innerIndex += 1) {
      std::advance(innerValue, outerIndex);

      sum = *outerValue + *innerValue;

      if (sum > limit) {
        break;
      }

      sumOfTwo.push_back(sum);
    }
  }

  sumOfTwo.sort();
  sumOfTwo.unique();

  for (auto element: sumOfTwo) {
    for (int index = start; index < element; index++) {
      total += index;
    }

    start = element + 1;
  }

  return total;
}