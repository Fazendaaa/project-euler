#                       1000-digit Fibonacci number
#
#   The Fibonacci sequence is defined by the recurrence relation:
#
#               Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
#   Hence the first 12 terms will be:
#
#        F1 = 1
#        F2 = 1
#        F3 = 2
#        F4 = 3
#        F5 = 5
#        F6 = 8
#        F7 = 13
#        F8 = 21
#        F9 = 34
#        F10 = 55
#        F11 = 89
#        F12 = 144
#
#   The 12th term, F12, is the first term to contain three digits.
#
#   What  is  the  index  of the first term in the Fibonacci sequence to contain
#   1000 digits?
#
#                            Answer: 4782

fibonacci__ <- function(n) {
  if (1 == n) {
    return(1)
  }
  if (2 == n) {
    return(1)
  }

  return(fibonacci(n - 1) + fibonacci(n - 2))
}

fibonacci <- memoise::memoise(fibonacci__)

digits <- function(number) length(unlist(strsplit(as.character(number), '')))

problem25memoise <- function(limit) {
  index <- 3

  while (digits(fibonacci(index)) < limit) {
    index <- index + 1
  }

  return (index)
}

#'
#' @export
#'
problem25 <- function(limit) {
  index <- 3
  n_1 <- 1
  n_2 <- 1
  n <- 2

  while (digits(n) < limit) {
    n_2 <- n_1
    n_1 <- n
    n <- n_1 + n_2

    index <- index + 1
  }

  return (index)
}