# Project Euler Package

#' Is Factor?
#'
#' @description
#' \code{isFactor} verifies whether or not a value is a factor of another one
#'
#' @section Complexity:
#' This function has the following complexity \textrm{O}(n)
#'
#' @author Fazendaaa
#'
#' @param acc Vector with accumulated values so far
#' @param cur Number to be checked
#' @param given Number that value is or not its factor
#'
#' @return A vector of numbers that are factors or an empty vector
#'
#' @examples
#' isFactor(c(), 2, 10)
#' isFactor(c(2), 5, 10)
#' isFactor(c(2), 3, 25600)
#'
#' @keywords internal
isFactor <- function(acc, cur, given) {
  if (0 == given %% cur) {
    dividend <- given / cur

    return (if (dividend != cur)
            append(acc, cur, dividend) else
            append(acc, cur))
  }

  return (c(acc))
}

#' Factors
#'
#' @description
#' \code{factors} takes a number and then returns \strong{all} of its factors
#'
#' @section Complexity:
#' This function has the following complexity \textrm{O}($n^{2}$)
#'
#' @author Fazendaaa
#'
#' @param given A integer.
#'
#' @return A vector of numbers.
#'
#' @examples
#' factors(1)
#' factors(123)
#' factors(456)
#'
#' @export
factors <- function(given) {
  reduced <- Reduce(function (acc, cur) isFactor(acc, cur, given), (1:given))

  return (sort(reduced))
}

#' Is Prime?
#'
#' @description
#' \code{isPrimes} checks whether or not a number is \emph{prime}
#'
#' @seeAlso \url{https://rosettacode.org/wiki/Primality_by_trial_division} to
#' read more in how this algorithm works
#'
#' @section Complexity:
#' This function has the following complexity \textrm{O}(\sqrt(n))
#'
#' @author Fazendaaa
#'
#' @param value A integer.
#'
#' @return Boolean.
#'
#' @examples
#' isPrime(2)
#' isPrime(4)
#' isPrime(13)
#'
#' @export
isPrime <- function(value) {
  limit <- ceiling(sqrt(value))

  if (2 == value) {
    return (TRUE)
  }
  if (2 > value || 0 == value %% 2) {
    return (FALSE)
  }

  return (!any(0 == value %% (2:limit)))
}

#' Zip
#'
#' @description
#' https://stackoverflow.com/a/57564884/7092954
#'
#' @export
#'
zip <- function(...) {
  mapply(list, ..., SIMPLIFY = FALSE)
}

#' Enumerate
#'
#' @description
#' https://stackoverflow.com/a/57564884/7092954
#'
#' @export
#'
enumerate <- function(...) {
  zip(index = seq_along(..1), ...)
}

#'
#' @export
#'
allDivisors <- function(element) {
  index <- 2
  divisors <- c(1)
  limit <- element / 2
  increment <- if (0 == element %% 2) 1 else 2

  while(index <= limit) {
    if (0 == element %% index) {
      divisors <- c(divisors, index)
    }

    index <- index + increment
  }

  divisors <- c(divisors, element)

  return (divisors)
}

toRunLimit__ <- function(start, end, toParallel) {
  item <- start
  results <- list()

  while (item <= end) {
    results[[as.character(item)]] <- toParallel(item)
    item <- item + 1
  }

  return (results)
}

#'
#' @export
#'
parallelizeLimit <- function(limit, toParallel) {
  library(doParallel)

  nCores <- detectCores() / 2
  cluster <- makeCluster(nCores)
  load <- floor(limit / nCores)

  results <- list()

  registerDoParallel(cluster)

  toRunLimit__ <- toRunLimit__
  toParallel <- toParallel

  results <- foreach(index = 1:nCores, .export = ls(globalenv())) %dopar% {
    start <- ((index - 1) * load) + 1
    end <- index * load

    return (toRunLimit__(start, end, toParallel))
  }

  stopCluster(cl = cluster)

  lastOne <- nCores * load

  # Handle the remaining load
  if (lastOne < limit) {
    results <- c(results, toRunLimit__(lastOne + 1, limit, toParallel))
  }

  return(results)
}

toRunData__ <- function(data, start, end, toParallel) {
  item <- start
  results <- list()

  while (item <= end) {
    curr <- data[item]
    results[[as.character(item)]] <- toParallel(curr)
    item <- item + 1
  }

  return (results)
}

#'
#' @export
#'
parallelizeData <- function(data, toParallel) {
  library(doParallel)

  nCores <- detectCores() / 2
  cluster <- makeCluster(nCores)
  limit <- length(data)
  load <- floor(limit / nCores)

  results <- list()

  registerDoParallel(cluster)

  toRunData__ <- toRunData__
  toParallel <- toParallel

  results <- foreach(index = 1:nCores, .export = ls(globalenv())) %dopar% {
    start <- ((index - 1) * load) + 1
    end <- index * load

    return (toRunData__(data, start, end, toParallel))
  }

  stopCluster(cl = cluster)

  lastOne <- nCores * load

  # Handle the remaining load
  if (lastOne < limit) {
    results <- c(results, toRunData__(data, lastOne + 1, limit, toParallel))
  }

  return(results)
}
