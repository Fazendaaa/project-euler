#                        Factorial digit sum
#
#    n! means n × (n − 1) × ... × 3 × 2 × 1
#
#    For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
#    digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
#    Find the sum of the digits in the number 100!
#
#                            Answer: 648

problem20 <- function(element) {
  stringFactorial <- largestFactorial(element)
  digits <- unlist(strsplit(stringFactorial, ""))

  return (Reduce(function(acc, x) acc + as.integer(x), digits, 0))
}
