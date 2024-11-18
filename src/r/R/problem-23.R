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

problem23_bruteForce <- function() {
  limit <- 28123
  twoNumbers <- list()
  abundant <- list()
  outerIndex <- 1
  innerIndex <- 1
  index <- 1
  sumOfResults <- 0
  total <- 0

  while (index < limit) {
    sum <- sumDivisors(index)

    if (sum > index) {
      abundant <- append(abundant, index)
    }

    index <- index + 1
  }

  abundant <- unlist(abundant)
  total <- length(abundant)

  while (outerIndex <= total) {
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

  index <- 1

  while (index <= limit) {
    if (is.null(unlist(twoNumbers[index]))) {
      sumOfResults <- sumOfResults + index
    }

    index <- index + 1
  }

  return (sumOfResults)
}

problem23_nonOptimized <- function() {
  limit <- 28123
  abundant <- getAllAbundant(limit)
  total <- length(abundant)
  index <- 0
  outerIndex <- 1
  twoNumbers <- list()
  sumOfResults <- 0

  while (outerIndex <= total) {
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

  while (index <= limit) {
    if (is.null(unlist(twoNumbers[index]))) {
      sumOfResults <- sumOfResults + index
    }

    index <- index + 1
  }

  return (sumOfResults)
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

  while (outerIndex <= total) {
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

  while (index <= limit) {
    if (is.null(unlist(twoNumbers[index]))) {
      sumOfResults <- sumOfResults + index
    }

    index <- index + 1
  }


  howManyTimesItAppears <- length(abundant) + 1
  sumOfTwoAbundant <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), abundant, 0)
  sumOfTwoNumbers <- function(abundant) {
    toParallel <- function(abundant) {
      return (function(item) {
        total <- length(abundant)
        twoNumbers <- list()
        innerIndex <- 1

        while (innerIndex <= total) {
          sumOfTwo <- item + abundant[outerIndex]

          if (sumOfTwo > limit) {
            break
          }

          twoNumbers[sumOfTwo] <- sumOfTwo

          innerIndex <- innerIndex + 1
        }

        return (twoNumbers)
      })
    }

    return (unname(unlist(parallelizeData(abundant, toParallel(abundant)))))
  }

  twoNumbers <- sumOfTwoNumbers(abundant)

  return (sumOfResults)
}