#                            Smallest multiple
#
#  2520  is the smallest number that can be divided by each of the numbers from
#  1 to 10 without any remainder.
#
#  What  is the smallest positive number that is evenly divisible by all of the
#  numbers from 1 to 20?
#
#                          Answer: 232792560
#

#' Smallest Multiple
#'
#' Performs a calculus to imply the smallest multiple
#'
#' @seeAlso \url{http://www.mathblog.dk/project-euler-problem-5/} helped me out
#' understand what's really going on
#' @param limit Up to tis number to be verified
#' @param acc The current calculus
#' @param cur Current value to be calculated
#' @keywords internal
smallestMultiple <- function(limit, acc, cur) {
    upTo <- floor(log10(limit) / log10(cur))

    return (acc * floor(cur ^ upTo))
}

#' Problem 5
#'
#' @param limit Number to be checking delimiter
#' @example
#' problem5(5)
#' problem5(10)
#' problem5(20)
#' @return The smallest number
#' @export
problem5 <- function(limit) {
    primes <- c(1, erastosthenesSieve(limit))

    return (Reduce(function (acc, cur) smallestMultiple(limit, acc, cur), primes))
}
