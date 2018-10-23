#                           Largest prime factor
# 
#   The prime factors of 13195 are 5, 7, 13 and 29.
# 
#   What is the largest prime factor of the number 600851475143?
# 
#                             Answer: 6857

#' Largest prime factor
#'
#' @description
#' \code{problem3} finds the \strong{largest} prime factor of given number
#'
#' @author Fazendaaa
#'
#' @section Waning:
#' This is a unneeded function, it's only purpose is to make code easier to
#' learn how to test and document it.
#'
#' @seealso \url{https://projecteuler.net/problem=3} for more info about it. 
#'
#' @param value A integer.
#'
#' @return A number
#'
#' @examples
#' problem3(1)
#' problem3(100)
#' problem3(13195)
#'
#' @export
problem3 <- function(value) max(Filter(isPrime, factors(value)))
