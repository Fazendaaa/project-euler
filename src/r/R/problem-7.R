#                              10001st prime
#
#  By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
#  that the 6th prime is 13.
#
#  What is the 10 001st prime number?
#
#                              Answer: 104743
#

#' Nth prime
#'
#' @description
#' \code{problem7} finds the nth prime
#'
#' @author Fazendaaa
#'
#' @seealso \url{https://projecteuler.net/problem=7} for more info about it
#'
#' @param limit Limit to run the interval
#'
#' @return The expected value
#'
#' @examples
#' problem7(13)
#' problem7(50)
#' problem7(100)
#'
#' @export
problem7 <- function(limit) {
    prime <- 0
    counter <- 0

    while (prime < limit) {
        counter <- counter + 1

        if (isPrime(counter)) {
            prime <- prime + 1
        }
    }

    return (counter)
}
