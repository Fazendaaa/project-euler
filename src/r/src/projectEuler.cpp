#include <Rcpp.h>
using namespace Rcpp;

// Erastosthenes Sieve
//
// Calculates the all prime numbers up till given limit
// 
// @seeAlso \url{https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes} for more
// info about how it works
// @param limit Calculation limit
// @return A list containing all prime numbers 
// @examples
// erastosthenesSieve(100)
// erastosthenesSieve(200)
// erastosthenesSieve(300)
// [[Rcpp::export]]
List erastosthenesSieve (double limit) {
    List foo (10);

    return foo;
}
