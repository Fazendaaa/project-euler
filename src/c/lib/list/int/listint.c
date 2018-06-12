#include <stdlib.h>
#include <string.h>
#include "listint.h"

// ---------------------------------------------------------------------------------------------------------------------

Comparisson match (const Data * a, const Data * b) {
    if (a < b) {
        return Lesser;
    } if (a > b) {
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

static Boolean __pushListInt (ListInt * list, const long int value) {
    long int * toPush = malloc (sizeof (long int));

    if (isNull (toPush)) {
        return False;
    }

    memcpy (toPush, &value, sizeof (long int));
    
    return push (list, toPush);
}

Boolean pushListInt (ListInt * list, const long int value) {
    if (isNull (list)) {
        return False;
    }

    return __pushListInt(list, value);
}

static long int __reduceListInt (const ListInt * list, Data (* operation) (const Data * acc, const Data * cur), long int initial) {
    long int * reduced = malloc (sizeof (long int));

    if (isNull (reduced)) {
        return 0;
    }

    memcpy (reduced, &initial, sizeof (long int));
    reduce (list, operation, reduce);

    return * reduced;
}

long int reduceListInt (const ListInt * list, Data (* operation) (const Data * acc, const Data * cur), long int initial) {
    if (isNull(list) || isNull(operation)) {
        return 0;
    }

    return __reduceListInt (list, operation, initial);
}

ListInt * filterListInt (const ListInt * list, Comparisson (* match) (const long int x, const long int y));

ListInt * zipWithListInt (const ListInt * first, const ListInt * second, long int (* operation) (long int x, long int y));

// ---------------------------------------------------------------------------------------------------------------------
