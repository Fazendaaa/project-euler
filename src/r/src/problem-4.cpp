#include <Rcpp.h>
#include <cmath>
#include <string>
#include <sstream>
#include <algorithm>
using namespace Rcpp;

// Is Palindrome
//
// @description
// \code{isPalindrome} Checks whether or not is a palindrome
//
// @section Complexity:
// This function has the following complexity \textrm{O}(\frac{n }{ 2 })
//
// @author Fazendaaa
//
// @param value
//
// @return Whether or not is a palindrome
//
// @examples
// isPalindrome(1)
// isPalindrome(121)
// isPalindrome(159999)
//
static bool isPalindrome (const int value) {
    std::string converted = std::to_string(value);
    const int limit = converted.length() - 1;
    const int middle = std::floor(limit / 2);

    for (unsigned int first = 0; first <= middle; first += 1) {
        const int last = limit - first;

        if (converted[first] != converted[last]) {
            return false;
        }
    }

    return true;
}

// Sequence palindrome
//
// @description
// Multiplies two numbers, verify whether or not this new value is a palindrome
// then check whether or not is greater than the largest palindrome so far, if 
// so returns it, otherwise returns the old max
//
// @section Complexity:
// This function has the following complexity \textrm{O}(\frac{ n }{ 2 })
//
// @author Fazendaaa
//
// @param acc
// @param x
// @param y
//
// @return All palindromes from this sequence and the cumulated ones
//
// @examples
// isPalindrome()
// isPalindrome()
// isPalindrome()
//
static double sequencePalindrome (const double acc, const double x, const double y) {
    const double multiplied = x * y;

    return isPalindrome(multiplied) ? std::max(multiplied, acc) : acc;
}

//' Max Palindrome
//'
//' @description
//' \code{maxPalindrome} finds the largest palindrome from comparison from a
//' given palindrome and a sequence to be verified
//'
//' @section Complexity:
// This function has the following complexity \textrm{O}(\frac{ $n^{2}$ }{ 2 })
//'
//' @author Fazendaaa
//'
//' @param old Max palindrome so far
//' @param from Lower limit to check data
//' @param limit Upper limit to check data
//'
//' @return The largest palindrome
//'
//' @examples
//' maxPalindrome(1, 2, 9)
//' maxPalindrome(29, 79, 99)
//' maxPalindrome(126, 345, 999)
//'
// [[Rcpp::export]]
double maxPalindrome (const double old, const double from, const double limit) {
    double cur = from;

    for (unsigned int iterator = from; iterator <= limit; iterator += 1) {
        cur = sequencePalindrome(cur, iterator, from);
    }

    return std::max(old, cur);
}
