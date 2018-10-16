# Project Euler Package

#' isFactor
#'
#' Verifies whether or not a value is a factor of another one. 
#' 
#' @param acc Vector with accumulated values so far
#' @param cur Number to be checked
#' @param given Number that value is or not its factor
#' @return A vector of numbers that are factors or an empty vector
#' @examples
#' \dontrun{
#' isFactor(c(), 2, 10)
#' isFactor(c(2), 5, 10)
#' }
#' @keywords internal
isFactor <- function(acc, cur, given) {
    if (0 == given %% cur) {
        dividend <- given / cur

        if (dividend != cur) {
            return (append(acc, cur, dividend))
        }

        return (append(acc, cur))
    }

    return (c(acc))
}

#' Factors
#'
#' Takes a number and then returns all of its factors.
#'of
#' @param given A integer.
#' @return A vector of numbers.
#' @examples
#' factors(1)
#' factors(123)
#' @export
factors <- function(given) {
    reduced <- Reduce(function (acc, cur) isFactor(acc, cur, given), (1:given))

    return (sort(reduced))
}

#' isPrime
#'
#' Checks whether or not a number is prime.
#'
#' @param value A integer.
#' @return Boolean.
#' @examples
#' isPrime(2)
#' isPrime(4)
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

#' Erastosthenes Sieve
#'
#' Calculates the all prime numbers up till given limit
#' 
#' @seeAlso \url{https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes} for more
#' info about how it works
#' @param limit Calculation limit
#' @return A list containing all prime numbers 
#' @examples
#' erastosthenesSieve(100)
#' erastosthenesSieve(200)
#' erastosthenesSieve(300)
#' @export
erastosthenesSieve <- function(limit) {
    sieveLimit <- ceiling(sqrt(limit))
}
