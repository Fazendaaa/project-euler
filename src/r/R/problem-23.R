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

  return (unname(unlist(parallelizeData(numbers, toParallel()))))
}

problem23_nonOptimized <- function(limit) {
  abundant <- c()
  index <- 1

  while (index < limit) {
    sum <- sumDivisors(index)

    if (sum > index) {
      abundant <- c(abundant, index)
    }

    index <- index + 1
  }

  howManyTimesItAppears <- length(abundant) + 1
  sumOfTwoAbundant <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), abundant, 0)

  return (0)
}

#'
#' @export
#'
problem23 <- function() {
  limit <- 28123
  abundant <- getAllAbundant(limit)
  total <- length(abundant)
  index <- 0
  outerIndex <- 1
  twoNumbers <- list()
  sumOfResults <- 0

  print('abundant')

  while (outerIndex <= total) {
    #sequence <- c()
    #sequence <- c(current + current, Map(function(item) current + item, tail(abundant, n = -index)))
    #twoNumbers <- c(twoNumbers, Filter(function(item) item < limit, sequence))

    innerIndex <- 1

    while (innerIndex <= total) {
      sumOfTwo <- abundant[innerIndex] + abundant[outerIndex]

      if (sumOfTwo > limit) {
        break
      }

      twoNumbers[sumOfTwo] <- sumOfTwo

      innerIndex <- innerIndex + 1
    }

    outerIndex <- outerIndex + 1
  }

  print('twoNumbers')

  while (index <= limit) {
    if (is.null(unlist(twoNumbers[index]))) {
      sumOfResults <- sumOfResults + index
    }
  }

  return (sumOfResults)
  #return (parallelReduce(lessThanLimit, function(acc, cur) acc + cur, 0))
}