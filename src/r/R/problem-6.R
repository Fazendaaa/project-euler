#                      Sum square difference
#
#  The sum of the squares of the first ten natural numbers is,
#
#                  1² + 2² + ... + 10² = 385
#
#  The square of the sum of the first ten natural numbers is,
#
#              (1 + 2 + ... + 10)² = 55² = 3025
#
#  Hence the difference between the sum of the squares of the first ten natural
#  numbers and the square of the sum is 3025 − 385 = 2640.
#
#  Find  the difference between the sum of the squares of the first one hundred
#  natural numbers and the square of the sum.
#
#                          Answer: 25164150
#

#' Sum square difference
#'
#' @description
#' \code{problem6} finds the difference between the sum of the squares of the
#' first 'n' natural numbers and the square of the sum.
#'
#' @section Complexity:
#' This function has the following complexity \textrm{O}($n^2$)
#'
#' @author Fazendaaa
#'
#' @seealso \url{https://projecteuler.net/problem=6} for more info about it
#'
#' @param limit Limit to run the interval
#'
#' @return The expected value
#'
#' @examples
#' problem6(10)
#' problem6(20)
#' problem6(50)
#'
#' @export
problem6 <- function(limit) {
    interval <- (1:limit)
    sumOfSquares <- Reduce(function(acc, cur) acc + (cur ^ 2), interval)
    squareOfSum <- (Reduce(function(acc, cur) acc + cur, interval)) ^ 2

    return (squareOfSum - sumOfSquares)
}
