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
#' @useDynLib projectEuler
#' @importFrom Rcpp sourceCpp
NULL

#' Smallest Multiple
#'
#' @description
#' Performs a calculus to imply the smallest multiple
#'
#' @author Fazendaaa
#'
#' @seeAlso \url{http://www.mathblog.dk/project-euler-problem-5/} helped me out
#' understand what's really going on
#'
#' @param limit Up to tis number to be verified
#' @param acc The current calculus
#' @param cur Current value to be calculated
#'
#' @return The smallest number
#'
#' @keywords internal
smallestMultiple <- function(limit, acc, cur) {
    upTo <- floor(log10(limit) / log10(cur))

    return (acc * floor(cur ^ upTo))
}

#' Problem 5
#'
#' @description
#' \code{problem5} finds the smallest positive number that is evenly divisible
#' by all of the numbers from 1 up to given limit
#'
#' @author Fazendaaa
#'
#' @seealso \url{https://projecteuler.net/problem=5} for more info about it
#'
#' @param limit Number to be checking delimiter
#'
#' @return The smallest number
#'
#' @examples
#' problem5(5)
#' problem5(10)
#' problem5(20)
#'
#' @export
problem5 <- function(limit) {
    primes <- c(1, erastosthenesSieve(limit))

    return (Reduce(function (acc, cur) smallestMultiple(limit, acc, cur), primes))
}
