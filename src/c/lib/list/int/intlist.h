#ifndef __INTLIST_H__
#define __INTLIST_H__

#include "../../data/data.h"
#include "../list.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef List IntList;

// ---------------------------------------------------------------------------------------------------------------------

IntList * allocIntList (void);

Boolean freeIntList (IntList ** list);

Boolean pushIntList (IntList * list, const long int value);

long int reduceIntList (const IntList * list, long int (* operation) (long int acc, long int cur));

IntList * filterIntList (const IntList * list, Comparisson (* match) (const long int x, const long int y));

IntList * zipWithIntList (const IntList * first, const IntList * second, long int (* operation) (long int x, long int y));

// ---------------------------------------------------------------------------------------------------------------------

#endif
