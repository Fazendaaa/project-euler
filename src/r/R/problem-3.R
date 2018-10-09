#                           Largest prime factor
# 
#   The prime factors of 13195 are 5, 7, 13 and 29.
# 
#   What is the largest prime factor of the number 600851475143?
# 
#                             Answer: 6857

#' Largest prime factor
#'
#' @aliases largest
#' @seealso \url{https://projecteuler.net/problem=3} for more info about it. 
#' @param value A integer.
#' @return A number
#' @examples
#' problem3(1)
#' problem3(13195)
#' @export
problem3 <- function(value) max(Filter(isPrime, factors(value)))