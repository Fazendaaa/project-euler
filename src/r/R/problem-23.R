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

sumOfTwoNumbers <- function(numbers) {
  library(doParallel)

  nCores <- detectCores() / 2
  cluster <- makeCluster(nCores)
  load <- floor(limit / nCores)

  results <- list()

  registerDoParallel(cluster)

  results <- foreach(index = 1:nCores, .export = ls(globalenv())) %dopar% {
    start <- ((index - 1) * load) + 1
    end <- index * load
    item <- start

    while (item <= end) {
      while (inner <=)
      results[[as.character(item)]] <- toParallel(item)
      item <- item + 1
    }

    return (results)
  }

  stopCluster(cl = cluster)

  lastOne <- nCores * load

  # Handle the remaining load
  if (lastOne < limit) {
    index <- lastOne

    while (index <= limit) {
      results[[as.character(index)]] <- toParallel(index)
      index <- index + 1
    }
  }

}

#'
#' @export
#'
problem23 <- function(limit) {
  toParallel <- function(item) {
    sumDivisors <- sumDivisors

    return (function (item) if(sumDivisors(item) > item) item else 0)
  }
  allAbundant <- Filter(function(item) 0 != item, unlist(parallelize(limit, toParallel())))
  results <- sumOfTwoNumbers(allAbundant)

  print(head(results, n = 5))

  return (allAbundant)
}
