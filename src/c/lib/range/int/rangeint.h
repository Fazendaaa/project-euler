#ifndef __RANGEINT_H__
#define __RANGEINT_H__

#include "../../data/data.h"
#include "../../list/int/listint.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef struct rangeInt {
    long int start, end, step;
} RangeInt;

// ---------------------------------------------------------------------------------------------------------------------

ListInt * listRangeInt (RangeInt range);

ListInt * filterRangeInt (RangeInt range, Boolean (* filter) (const long int value));

ListInt * deleteListFromRangeInt (RangeInt range, ListInt * list);

long int reduceRangeInt (RangeInt range, long int (* function) (const long int acc, const long int cur), const long int init);

// ---------------------------------------------------------------------------------------------------------------------

#endif
