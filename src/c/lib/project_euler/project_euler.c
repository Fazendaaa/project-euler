#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "project_euler.h"
#include "../range/int/rangeint.h"

// ---------------------------------------------------------------------------------------------------------------------

static ListInt * __factors (const long int limit) {
    ListInt * fact = allocListInt();
    Index sqrLimit = sqrt (limit);
    long int dividend = 0;

    if (isNull (fact)) {
        return NULL;
    }

    for (Index index = 1; index < sqrLimit; index += 1) {
        if (0 == (limit % index)) {
            dividend = limit / index;

            if (dividend > index) {
                pushListInt (fact, dividend);
            }

            pushListInt (fact, index);
        }
    }

    return fact;
}

// ---------------------------------------------------------------------------------------------------------------------

Data * sumInt (Data * acc, const Data * cur) {
    return (Data *) (castInt (acc) += castInt (cur));
}

Data * multInt (Data * acc, const Data * cur) {
    return (Data *) (castInt (acc) *= castInt (cur));
}

Boolean isIntEven (const Data * value) {
    return 0 == (castInt (value) % 2);
}

Boolean isIntOdd (const Data * value) {
    return 0 != (castInt (value) % 2);
}

Boolean isIntPrime (const Data * value) {
    Index primeLimit = sqrt (castInt (value)) + 1;

    if (2 > castInt (value)) {
        return False;
    }

    if (2 == castInt (value)) {
        return True;
    }

    for (Index iterator = 2; iterator < primeLimit; iterator += 1) {
        if (0 == castInt (value) % iterator) {
            return False;
        }
    }

    return True;
}

Boolean isIntPalindrome (const long int value) {
    char buffer [256];
    long int length = 0, middle = 0, end = 0;

    sprintf (buffer, "%ld", value);
    length = strlen (buffer);
    middle = ((long int) (length / 2));
    end = length - 1;

    for (Index iterator = 0; iterator < middle; iterator += 1) {
        if (buffer [iterator] != buffer [end - iterator]) {
            return False;
        }
    }

    return True;
}

ListInt * factors (const long int limit) {
    if (1 > limit) {
        return NULL;
    }

    return __factors (limit);
}

long int maxListInt (const ListInt * list) {
    long int max = 0;

    for (ListElement * element = list->head; isNotNull (element); element = element->next) {
        if (castInt (element->data) > max) {
            max = castInt (element->data);
        }
    }

    return max;
}

// This could be improved by using hash.
ListInt * eratosthenesSieve (const long int limit) {
    RangeInt range;
    const Index limitSqrt = sqrt (limit) + 1;
    ListInt * multiples = NULL, * primes = NULL;
    long int product = 0;

    if (1 >= limit) {
        return NULL;
    }

    multiples = allocListInt();

    if (isNull (multiples)) {
        return NULL;
    }

    for (Index first = 2; first < limitSqrt; first += 1) {
        for (Index second = 2; second < limit; second += 1) {
            product = first * second;

            if (product > limit) {
                break;
            } 

            pushListInt (multiples, product);
        }
    }

    range.step = 1;
    range.start = 2;
    range.end = limit;


    primes = deleteListFromRangeInt (range, multiples);
    freeListInt (&multiples);    

    return primes;
}

MatrixInt * readMatrixInt (const char * path) {
    FILE * filePointer = fopen(path, "r");
    MatrixInt * matrix = NULL;

    if (isNull (filePointer)) {
        return NULL;
    }

    matrix = allocMatrixInt ();

    if (isNull (matrix)) {
        return NULL;
    }

    return matrix;
}

// ---------------------------------------------------------------------------------------------------------------------
