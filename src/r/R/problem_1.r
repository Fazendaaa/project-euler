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
#' @keywords internal
#' @seealso \url{https://projecteuler.net/problem=1} for more info about it.
#' @param limit A postive integer.
#' @return A vector.
#' @examples
#' multiples(10) # [ 3, 5, 6, 9 ]
#' multiples(1000) # [ 3, 5, 6, 9, 10, ..., 999 ]
multiples <- function (limit) {
    values <- seq(1:(limit - 1))

    return(subset(values, 0 == values %% 3 | 0 == values %% 5))
}

#' Sum of multiples of 3 or 5
#' 
#' @export
#' @describeIn multiples \code{myFunc} just sum the values.
#' @section Waning:
#' This is a unneeded function, it's only purpose is to make code easier to
#' learn how to test and document it.
#' @inheritParams multiples
#' @return The total of the sum.
#' @examples
#' myFunc(10) # 23
#' myFunc(1000) # 233168
#' \dontrun{
#' myFunc(1.2)
#' myFunc("a")
#' myFunc([...])
#' }
myFunc <- function (limit) sum(multiples(limit))
