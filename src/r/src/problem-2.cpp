#include <Rcpp.h>
using namespace Rcpp;

// Fibonnacci
//
// @description
// \code{fibonacci} seeks a number in the nth position in the Fibonacci sequence
//
// @section Complexity:
// This function has the following complexity \textrm{O}(n)
//
// @author Fazendaaa
//
// @param position The wanted Fibonacci position
//
// @return The value of the Fibonacci position
//
// @examples
// fibonacci(10) 
// fibonacci(100) 
// fibonacci(1000) 
//
double fibonacci(double position) {
    double first = 1, second = 1, third = 0;

    for (int i = 0; i < position; i++) {
        first = second;
        second = third;

        third = first + second; 
    }

    return third;
}

//' Even Fibonnacci
//'
//' @description
//' \code{evenFibonnacci} sums of all of the even Fibonacci number starting at
//' given postion to its limits, saving in the total 
//'
//' @section Complexity:
//' This function has the following complexity \textrm{O}($n^{2}$)
//'
//' @author Fazendaaa
//'
//' @param position The current position
//' @param limit The wanted position
//' @param total The accumulated value
//'
//' @return The calculated result
//'
//' @examples
//' evenFibonacci(0, 10, 10)
//' evenFibonacci(5, 50, 50)
//' evenFibonacci(50, 1000, 870)
//'
// [[Rcpp::export]]
double evenFibonacci(double position, double limit, double total) {
    double value = fibonacci(position);
    double newTotal = (0 == ((int) value) % 2) ? total + value : total;

    return (value <= limit) ? evenFibonacci(position+1, limit, newTotal) : total;
}
