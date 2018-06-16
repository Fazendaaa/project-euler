#ifndef __PROJECT_EULER_H__
#define __PROJECT_EULER_H__

#include "../data/data.h"
#include "../list/int/listint.h"
#include "../matrix/int/matrixint.h"

// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------

Data * sumInt (Data * acc, const Data * cur);

Data * multInt (Data * acc, const Data * cur);

Boolean isIntEven (const Data * value);

Boolean isIntOdd (const Data * value);

Boolean isIntPrime (const Data * value);

Boolean isIntPalindrome (const long int value);

ListInt * factors (const long int limit);

long int maxListInt (const ListInt * list);

ListInt * eratosthenesSieve (const long int limit);

MatrixInt * readMatrixInt (const char * path);

// ---------------------------------------------------------------------------------------------------------------------

#endif
