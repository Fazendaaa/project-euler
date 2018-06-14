#include <stdlib.h>
#include <string.h>
#include "listint.h"

// ---------------------------------------------------------------------------------------------------------------------

Comparisson match (const Data * a, const Data * b) {
    long int result = castInt (a) - castInt (b);
    
    if (0 > result) {
        return Lesser;
    } if (0 < result) {
        return Greater;
    }

    return Equal;
}

Boolean destroy (Data * data) {
    free (data);

    return True;
}

// ---------------------------------------------------------------------------------------------------------------------

ListInt * allocListInt (void) {
    return allocList(destroy, match);
}

Boolean freeListInt (ListInt ** list) {
    return freeList(list);
}

Boolean pushListInt (ListInt * list, const long int value) {
    long int * toPush = NULL;

    if (isNull (list)) {
        return False;
    }

    toPush = malloc (sizeof (long int));

    if (isNull (toPush)) {
        return False;
    }

    memcpy (toPush, &value, sizeof (long int));

    return push (list, toPush);
}

long int postionListInt (ListInt * list, const Index pos) {
    return castInt (postion (list, pos));
}

long int reduceListInt (const ListInt * list, Data * (* operation) (Data * acc, const Data * cur), long int initial) {
    long int * reduced = malloc (sizeof (long int));
    
    if (isNull(list) || isNull(operation) || isNull (reduced)) {
        return 0;
    }

    memcpy (reduced, &initial, sizeof (long int));
    reduce (list, operation, reduced);

    return * reduced;
}

ListInt * filterListInt (const ListInt * list, Boolean (* match) (const Data * value)) {
    ListInt * filtered = allocListInt();

    return filter (list, match, filtered, sizeof (long int));
}

ListInt * zipWithListInt (const ListInt * first, const ListInt * second, long int (* operation) (long int x, long int y));

// ---------------------------------------------------------------------------------------------------------------------
