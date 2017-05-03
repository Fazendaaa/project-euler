/*
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
*/

#include "../project_euler.hpp"
using namespace std;

int main( int argc, char **argv ) {
    int LIMIT = 13195;
    vector<int> primesFactor = eratosthenesSieve( LIMIT );
    
    for( int i = 0; i < LIMIT; i++ )
        cout << primesFactor[ i ] << endl;

    return 0;
}
