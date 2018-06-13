/*
                            Largest palindrome product

    A  palindromic  number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.

                                Answer: 906609
*/

#include <math.h>
#include <stdio.h>
#include "../lib/data/data.h"
#include "../lib/list/int/listint.h"
#include "../lib/range/int/rangeint.h"
#include "../lib/project_euler/project_euler.h"

static ListInt * palindromesProducts (RangeInt range) {
    ListInt * list = allocListInt();

    if (isNotNull (list)) {
        
    }

    return list;
}

static long int largestPalindromeProduct (long int digits) {
    RangeInt range;
    long int max = 0;
    ListInt * products = NULL;

    range.step = 1;
    range.end = pow (10, digits) - 1;
    range.start = pow (10, digits - 1);

    products = palindromesProducts (range);

    if (isNotNull (products)) {
        max = maxListInt (products);
        freeListInt (&products);

        return max;
    }

    return -1;
}

int main (int argc, char ** argv) {
    long int digits = 2;

    printf ("%ld\n", largestPalindromeProduct (digits));

    return 0;
}
