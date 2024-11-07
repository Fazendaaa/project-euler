#                               Amicable numbers
#
#   Let  d(n) be defined as the sum of proper divisors of n (numbers less than n
#   which  divide  evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a
#   and b are an amicable pair and each of a and b are called amicable numbers.
#
#   For  example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
#   55  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
#   71 and 142; so d(284) = 220.
#
#   Evaluate the sum of all the amicable numbers under 10000.
#
#                               Answer: 31626
#
#   Helped me out:
#       *   https://en.wikipedia.org/wiki/Amicable_numbers
#

allDivisors <- function(element) {
  index <- 2
  divisors <- c(1)

  while(index <= element) {
    if (0 == element %% index) {
      divisors <- c(divisors, index)
    }

    index <- index + 1
  }

  return (divisors)
}

#' @export
problem21 <- function(limit) {
  if (limit < 283) {
    return (0)
  }

  library(doParallel)

  nCores <- detectCores() / 2
  cluster <- makeCluster(nCores)
  load <- floor(limit / nCores)

  properDivisors <- list()

  registerDoParallel(cluster)

  allDivisors <- allDivisors

  properDivisors <- foreach(index = 1:nCores, .export = ls(globalenv())) %dopar% {
    start <- ((index - 1) * load) + 1
    end <- index * load
    item <- start

    while (item <= end) {
      properDivisors[[as.character(item)]] <- allDivisors(item)
      item <- item + 1
    }

    return (properDivisors)
  }

  stopCluster(cl = cluster)

  divisors <- list()

  for (item in properDivisors) {
    divisors <- c(divisors, item)
  }

  lastOne <- nCores * load

  # Handle the remaining load
  if (lastOne < limit) {
    index <- lastOne

    while (index <= limit) {
      divisors[[as.character(index)]] <- allDivisors(index)
      index <- index + 1
    }
  }

  amicable <- c()
  # sum only the divisors of a number without counting the number itself
  removeTheLastOneAndSum <- function(item) sum(head(item, -1))

  for (item in divisors) {
    first <- tail(item, n = 1)
    second <- as.character(removeTheLastOneAndSum(item))

    if (first != second && removeTheLastOneAndSum(divisors[[second]]) == first) {
      amicable <- c(amicable, first)
    }
  }

  return (sum(amicable))
}
