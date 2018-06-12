#ifndef __INTLIST_H__
#define __INTLIST_H__

#include "../../data/data.h"
#include "../list.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef List ListInt;

// ---------------------------------------------------------------------------------------------------------------------

ListInt * allocListInt (void);

Boolean freeListInt (ListInt ** list);

Boolean pushListInt (ListInt * list, const long int value);

long int reduceListInt (const ListInt * list, Data (* operation) (const Data * acc, const Data * cur), long int initial);

ListInt * filterListInt (const ListInt * list, Comparisson (* match) (const long int x, const long int y));

ListInt * zipWithListInt (const ListInt * first, const ListInt * second, long int (* operation) (long int x, long int y));

// ---------------------------------------------------------------------------------------------------------------------

#endif
