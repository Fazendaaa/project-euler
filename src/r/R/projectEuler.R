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
