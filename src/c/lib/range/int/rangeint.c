#include <stdlib.h>
#include "rangeint.h"

#include <stdio.h>

// ---------------------------------------------------------------------------------------------------------------------

ListInt * filterRangeInt (RangeInt range, Boolean (* filter) (const long int value)) {
    ListInt * list = allocListInt();

    if (isNull (list) || isNull (filter)) {
        return NULL;
    }

    for (long int iterator = range.start; iterator < range.end; iterator += range.step) {
        if (filter (iterator)) {
            pushListInt (list, iterator);
        }
    }

    return list;
}

// ---------------------------------------------------------------------------------------------------------------------
