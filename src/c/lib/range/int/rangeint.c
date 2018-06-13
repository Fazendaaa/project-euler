#include <stdlib.h>
#include "rangeint.h"

#include <stdio.h>

// ---------------------------------------------------------------------------------------------------------------------

ListInt * filterRangeInt (RangeInt range, Boolean (* filter) (const long int value)) {
    ListInt * list = NULL;

    if (isNull (filter)) {
        return NULL;        
    } 

    list = allocListInt();

    if (isNull (list)) {
        return NULL;
    }

    for (long int iterator = range.start; iterator < range.end; iterator += range.step) {
        if (filter (iterator)) {
            pushListInt (list, iterator);
        }
    }

    return list;
}

ListInt * mapRangeInt (RangeInt range, long int (* map) (const long int value));

// ---------------------------------------------------------------------------------------------------------------------
