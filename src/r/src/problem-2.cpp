#include <Rcpp.h>
using namespace Rcpp;

//' Seeks a number in the Fibonacci sequence
//'
//' @param position The wanted position
// [[Rcpp::export]]
double fibonacci(double position) {
    double first = 1, second = 1, third = 0;

    for (int i = 0; i < position; i++) {
        first = second;
        second = third;

        third = first + second; 
    }

    return third;
}
