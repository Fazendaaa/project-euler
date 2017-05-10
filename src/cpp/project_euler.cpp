#include "project_euler.hpp"
using namespace std;

vector<int> eratosthenesSieve( int max ) {
    vector<bool> numbers( true, max );
    vector<int> primes;
    numbers[ 0 ] = numbers[ 1 ] = false;

    for( int i = 2; i < sqrt( max ); i++ )
        if( numbers[ i ] )
            for( int j = pow( i, 2 ); j < max ; j += 1 )
                numbers[ j ] = false;
    
    for( int i = 0; i < max; i++ )
        if( numbers[ i ] ) {
            primes.resize( primes.size( ) + 1 );
            primes[ primes.size() - 1 ] = i;
        }

    return primes;
}
