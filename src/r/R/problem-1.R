#							Multiples of 3 and 5
#
#	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#	get 3, 5, 6 and 9. The sum of these multiples is 23.
#
#	Find the sum of all the multiples of 3 or 5 below 1000.
#
#							Answer: 233168
#

#' Multiples of 3 or 5
#'
#' \code{multiples} fetch \strong{all} numbers of multiples of \emph{3} or
#' \emph{5} up until given limit.
#'
#' @alises multiples
#' @seealso \url{https://projecteuler.net/problem=1} for more info about it.
#' @param limit A positive integer.
#' @return A vector.
#' @examples
#' multiples(10)
#' multiples(1000)
#' @keywords internal
multiples <- function (limit) {
    values <- (1:(limit - 1))

    return(subset(values, 0 == values %% 3 | 0 == values %% 5))
}

#' Sum of multiples of 3 or 5
#' 
#' @alises multiples sum
#' @describeIn multiples \code{problem1} just sum the values.
#' @section Waning:
#' This is a unneeded function, it's only purpose is to make code easier to
#' learn how to test and document it.
#' @inheritParams multiples
#' @importFrom assertthat is.count
#' @return The total of the sum.
#' @examples
#' problem1(10)
#' problem1(1000)
#' @export
problem1 <- function (limit) {
    if (TRUE == is.finite(limit) && TRUE == is.count(limit)) {
        return (sum(multiples(limit)))
    }

    stop("value must be a positive integer")
}
