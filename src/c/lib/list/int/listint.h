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

long int postionListInt (ListInt * list, const Index pos);

long int reduceListInt (const ListInt * list, Data * (* operation) (Data * acc, const Data * cur), long int initial);

ListInt * filterListInt (const ListInt * list, Boolean (* match) (const Data * value));

ListInt * zipWithListInt (const ListInt * first, const ListInt * second, long int (* operation) (long int x, long int y));

// ---------------------------------------------------------------------------------------------------------------------

#endif
