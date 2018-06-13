#ifndef __PROJECT_EULER_H__
#define __PROJECT_EULER_H__

#include "../data/data.h"
#include "../list/int/listint.h"

// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------

Data * sumInt (Data * acc, const Data * cur);

Boolean isIntEven (const Data * value);

Boolean isIntOdd (const Data * value);

Boolean isIntPrime (const Data * value);

ListInt * factors (const long int limit);

long int maxListInt (const ListInt * list);

// ---------------------------------------------------------------------------------------------------------------------

#endif
