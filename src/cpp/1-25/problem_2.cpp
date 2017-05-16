/*
							Even Fibonacci numbers

	Each  new term in the Fibonacci sequence is generated by adding the previous
	two terms. By starting with 1 and 2, the first 10 terms will be:

					1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

	By  considering  the  terms  in  the  Fibonacci sequence whose values do not
	exceed four million, find the sum of the even-valued terms.

								Answer: 4613732
*/

#include <iostream>
using namespace std;

int main( int argc, char **argv ) {
    int x0 = 1, x1 = 2, x2 = 0, sum = 2;

    while( x2 < 4000000 ) {
        x2 = x1 + x0;
        sum += ( 0 == x2%2 ) ? x2 : 0; 
        x0 = x1;
        x1 = x2;
    }

    cout << sum << endl;

    return 0;
}