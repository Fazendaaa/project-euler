#                         Largest palindrome product
#
# A  palindromic  number  reads  the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
#                             Answer: 906609

#' Is Palindrome
#'
#' Checks whether or not is a palindrome
#'
#' @param value Number to be verified
#' @returns Comparison result
#' @examples
#' \dontrun{
#' isPalindrome(1)
#' isPalindrome(21)
#' isPalindrome(9009)
#' }
#' @keywords internal
isPalindrome <- function(value) {
    converted <- as.character(value)
    limit <- nchar(converted)
    middle <- floor(limit / 2)

    # No any() readble equivalent
    for (iterator in (0:middle)) {
        first <- iterator + 1
        second <- limit - iterator
        firstChar <- substr(converted, first, first)
        secondChar <- substr(converted, second, second)

        if (firstChar != secondChar) {
            return (FALSE)
        }
    }

    return (TRUE)
}

#' Sequence palindrome
#'
#' Multiplies two numbers, verify whehter or not this new value is a palindrome
#' then check whether or not is greater than the largest palindrome so far, if 
#' so returns it, otherwise returns the old max
#'
#' @param acc Max palindrome so far
#' @param x Number to be multiplied
#' @param y Number to be multiplied
#' @return The largest palindrome
#' @examples
#' \dontrun{
#' sequencePalindrome(1, 2, 9)
#' sequencePalindrome(29, 79, 99)
#' sequencePalindrome(126, 345, 999)
#' }
#' @keywords internal
sequencePalindrome <-  function(acc, x, y) {
    multiplied <- x * y

    return (if (isPalindrome(multiplied)) max(multiplied, acc) else acc)
}

#' Max PalindromeWhether or not is a palindrome
#'
#' The  largest  palindrome  from  comparssion  from  a  given  palindrome and a
#' sequence to be verified
#'
#' @param old Max palindrome so far
#' @param from Lower limit to check data
#' @param limit Upper limit to check data
#' @return The largest palindrome
#' @examples
#' \dontrun{
#' maxPalindrome(1, 2, 9)
#' maxPalindrome(29, 79, 99)
#' maxPalindrome(126, 345, 999)
#' }
#' @keywords internal
maxPalindrome <- function (old, from, limit) {
    cur <- Reduce(function (acc, cur) sequencePalindrome(acc, cur, from),
                  (from:limit))

    return (max(old, cur))
}

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
