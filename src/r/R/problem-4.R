#                         Largest palindrome product
#
# A  palindromic  number  reads  the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
#                             Answer: 906609
#' @useDynLib projectEuler
#' @importFrom Rcpp sourceCpp
NULL

#' Largest Palindrome Product
#'
#' Calculates the largest palindrome from
#'
#' @seealso \url{https://projecteuler.net/problem=4} for more info about it
#' @param digits Number of max digits to run comparison
#' @return The result number
#' @examples
#' problem4(1)
#' problem4(2)
#' problem4(3)
#' @export
problem4 <- function(digits) {
    lower <- 10 ** (digits - 1)
    upper <- (10 ** digits) - 1

    return (Reduce(function (acc, cur) maxPalindrome(acc, cur, upper),
            (lower:upper)))
}
