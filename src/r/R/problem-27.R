#                            Quadratic primes
#
#   Euler discovered the remarkable quadratic formula:
#
#                               n² + n + 41
#
#   It  turns  out  that  the formula will produce 40 primes for the consecutive
#   integer   values   0≤n≤39.   However,  when n=40,  40²+40+41=40(40+1)+41  is
#   divisible  by 41, and certainly when n=41, 41²+41+41 is clearly divisible by
#   41.
#
#   The  incredible formula n²−79n+1601 was discovered, which produces 80 primes
#   for  the consecutive values 0≤n≤79. The product of the coefficients, −79 and
#   1601, is −126479.
#
#   Considering quadratics of the form:
#
#           n²+an+b, where |a|<1000 and |b|≤1000
#
#           where |n| is the modulus/absolute value of n
#           e.g. |11|=11 and |−4|=4
#
#   Find   the  product  of  the  coefficients,  a  and  b,  for  the  quadratic
#   expression that produces the maximum number of primes for consecutive values
#   of n, starting with n=0.
#
#                              Answer: -59231

quadratic_primes <- function(a, b) {
  modA <- abs(a)
  modB <- abs(b)
  maxA <- 0
  maxB <- 0
  maxCoef <- 0
  external <- -modA
  internal <- -modB
  sizeDivisors <- function(x) length(allDivisors(x, toBeSorted = FALSE))

  while (external < modA) {
    while (internal < modB) {
      n <- 0

      while (2 == sizeDivisors(n^2 + external*n + internal)) {
        n <- n + 1
      }

      if (n > maxCoef) {
        maxCoef <- n
        maxA <- external
        maxB <- internal
      }

      internal <- internal + 1
    }

    external <- external + 1
  }

  return (
    list(
      maxA = maxA,
      maxB = maxB
    )
  )
}

#'
#' @export
#'
problem27 <- function(limit) {
  result <- quadratic_primes(limit, limit)

  return (result[['maxA']] * result[['maxB']])
}