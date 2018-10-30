#include <Rcpp.h>
#include <algorithm>
using namespace Rcpp;

//' Erastosthenes Sieve
//'
//' @description
//' \code{erastosthenesSieve} calculates the all prime numbers up till given
//' limit
//'
//' @section Complexity:
//' This function has the following complexity \textrm{O}(\frac{ \sqrt(n) }{ 2 })
//'
//' @author Fazendaaa
//'
//' @seeAlso \url{https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes} for more
//' info about how it works
//'
//' @param limit Calculation limit
//'
//' @return A list containing all prime numbers 
//'
//' @examples
//' erastosthenesSieve(100)
//' erastosthenesSieve(200)
//' erastosthenesSieve(300)
//'
// [[Rcpp::export]]
NumericVector erastosthenesSieve (const double limit) {
    const int sieveLimit = std::ceil(sqrt(limit));
    NumericVector multiples, primes;

    for (unsigned int i = 2; i < sieveLimit; i += 1) {
        for (unsigned int multiplyBy = 2; multiplyBy < limit; multiplyBy += 1) {
            const unsigned int product = multiplyBy * i;

            if (product > limit) {
                break;
            }

            multiples.push_back(product);
        }
    }

    for (unsigned int i = 2; i < limit; i += 1) {
        if (std::find(multiples.begin(), multiples.end(), i) == multiples.end()) {
            primes.push_back(i);
        }
    }

    return primes;
}
