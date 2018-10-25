#include <Rcpp.h>
using namespace Rcpp;

// Multiply Range
//
// @description
// \code{multiplyRange} finds the max number of digits multiplication given due
// range
//
// @section Complexity:
// This function has the following complexity \textrm{O}(n)
//
// @author Fazendaaa
//
// @param numbers Digits to iterate over
// @param start Begin point
// @param end Finish point
//
// @return The expected value
//
// @examples
// problem8(c(1, 2, 3, 4, 5), -1, 2)
// problem8((1:10), 0, 4)
// problem8((1:100), 5, 13)
//
double multiplyRange (NumericVector numbers, const double start, const double end) {
    unsigned int iterator = (start >= 0) ? start : 0;
    double total = 1;

    for (; iterator < end; iterator += 1) {
        total *= numbers[iterator];
    }

    return total;
}

//' Greatest
//'
//' @description
//' \code{greatest} finds the max number of digits multiplication
//'
//' @section Complexity:
//' This function has the following complexity \textrm{O}($n^2$)
//'
//' @author Fazendaaa
//'
//' @param numbers Digits to iterate over
//' @param digits Max number of digits to compute
//'
//' @return The expected value
//'
//' @examples
//' problem8(c(1, 2, 3, 4, 5), 2)
//' problem8((1:10), 4)
//' problem8((1:100), 13)
//'
// [[Rcpp::export]]
double greatestProduct (NumericVector numbers, const double digits) {
    double max = 0, tmp = 0;

    for (unsigned int iterator = 0; iterator <= numbers.size(); iterator += 1) {
        tmp = multiplyRange(numbers, iterator - digits, iterator);

        if (tmp > max) {
            max = tmp;
        }
    }

    return max;
}
