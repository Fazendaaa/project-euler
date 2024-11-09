#                             Non-abundant sums
#
# A  perfect  number  is  a number for which the sum of its proper divisors is
# exactly  equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A  number  n  is  called deficient if the sum of its proper divisors is less
# than n and it is called abundant if this sum exceeds n.
#
# As  12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number  that  can  be  written  as the sum of two abundant numbers is 24. By
# mathematical  analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot  be  reduced any further by analysis even though it is known that the
# greatest  number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.
#
#                             Answer: 4179871

sumDivisors <- function(number) sum(head(allDivisors(number), n = -1))

getAllAbundant <- function(limit) {
  toParallel <- function(item) {
    sumDivisors <- sumDivisors

    return (function (item) if(sumDivisors(item) > item) item else NULL)
  }

  return (unname(unlist(parallelizeLimit(limit, toParallel()))))
}

sumOfTwoNumbers <- function(numbers) {
  howManyTimesItAppears <- length(numbers) + 1
  toParallel <- function(item) {
    howManyTimesItAppears <- howManyTimesItAppears

    return (function(item) item * howManyTimesItAppears)
  }

  return (Reduce(function(acc, cur) acc + cur, unlist(parallelizeData(numbers, toParallel())), 0))
}

#'
#' @export
#'
problem23 <- function(limit) sumOfTwoNumbers(getAllAbundant(limit))
