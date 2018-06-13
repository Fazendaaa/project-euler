#ifndef __RANGEINT_H__
#define __RANGEINT_H__

#include "../../data/data.h"
#include "../../list/int/listint.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef struct rangeInt {
    long int start, end, step;
} RangeInt;

// ---------------------------------------------------------------------------------------------------------------------

ListInt * filterRangeInt (RangeInt range, Boolean (* filter) (const long int value));

// ---------------------------------------------------------------------------------------------------------------------

#endif
