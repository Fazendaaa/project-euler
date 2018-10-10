#include <Rcpp.h>
using namespace Rcpp;

// Seeks a number in the Fibonacci sequence
//
// position The wanted position
double fibonacci(double position) {
    double first = 1, second = 1, third = 0;

    for (int i = 0; i < position; i++) {
        first = second;
        second = third;

        third = first + second; 
    }

    return third;
}

//' Returns the sum of all of the even Fibonacci number starting at given
//' postion to its limits, saving in the total 
//'
//' @param position The current position
//' @param limit The wanted position
//' @param total The accumulated value
// [[Rcpp::export]]
double recursiveEvenFibonacci(double position, double limit, double total) {
    double value = fibonacci(position);
    double newTotal = (0 == ((int) value) % 2) ? total + value : total;

    return (value <= limit) ? recursiveEvenFibonacci(position+1, limit, newTotal) : total;
}
