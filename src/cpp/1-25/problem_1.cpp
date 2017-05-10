/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/

#include <iostream>
using namespace std;

static int isMultiple( const int n ) {
    return ( 0 == n%3 || 0 == n%5 || 0 == n%6 || 0 == n%9 ) ? n : 0;
}

int main( int argc, char **argv ) {
    int LIMIT = 1000, sum = 0;

    for( int i = 0; i < LIMIT; i++ )
        sum += isMultiple( i );

    cout << sum << endl;

    return 0;
}
