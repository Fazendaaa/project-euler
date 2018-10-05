# Project Euler Package

#' isFactor
#'
#' Verifies whether or not a value is a factor of another one. 
#' 
#' @param acc Vector with accumulated values so far
#' @param value Number to be checked
#' @param given Number that value is or not its factor
#' @return A vector of numbers that are factors or an empty vector
#' @examples
#' isFactor(c(), 2, 10)
#' isFactor(c(2), 5, 10)
#' isFactor(c(2, 5), 9, 10)
#' @keywords internal
isFactor <- function(acc, value, given) {
    print(acc, value, given)
    if (0 == value %% given) {
        dividend <- given / value

        if (dividend != value) {
            return (append(acc, value, dividend))
        }

        return (append(acc, value))
    }

    return (acc)
}

#' Factors
#'
#' Takes a number and then returns all of its factors.
#'
#' @aliases factor
#' @param given A integer.
#' @return A vector of numbers.
#' @examples
#' factors(1)
#' factors(123)
#' factors(213713)
#' @export
factors <- function(given) {
    limit <- sqrt(given) + 1

    reduced <- Reduce(isFactor, (2:limit), given)
    print(reduced)

    return (reduced)
}

#' validatePrime
#'
#' Verifies whether or not a number is prime compared to one iterated number.
#'
#' @param given Number to be verified
#' @param iterator Number to compare given to it
#' @return Boolean
#' @examples
#' validatePrime(1, 1)
#' validatePrime(2, 4)
#' validatePrime(5, 13)
#' @keywords internal
validatePrime <- function(given, iterator) {
    if (0 == given %% iterator) {
        return (FALSE)
    }

    return (TRUE)
}

#' isPrime
#'
#' Checks whether or not a number is prime.
#'
#' @aliases prime numbers
#' @param input A integer.
#' @return Boolean.
#' @examples
#' isPrime(1)
#' isPrime(2)
#' isPrime(4)
#' @export
isPrime <- function(input) {
    limit <- sqrt(input) + 1

    if (2 < input) {
        return (FALSE)
    }
    if (2 == input) {
        return (TRUE)
    }

    return (Reduce((2:limit), validatePrime, true))
}
