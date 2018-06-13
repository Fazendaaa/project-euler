#include <stdlib.h>
#include "setint.h"

// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------

ListInt * zipSetRangeIntWith (RangeInt first, RangeInt second, long int (* function) (const long int x, const long int y)) {
    ListInt *list = NULL;

    if (isNull (function)) {
        return NULL;
    }

    list = allocListInt();

    if (isNotNull (list)) {
        for (Index firstIndex = first.start; firstIndex < first.end; firstIndex += first.step) {
            for (Index secondIndex = firstIndex; secondIndex < second.end; secondIndex += second.step) {
                pushListInt (list, function (firstIndex, secondIndex));
            }
        }
    }

    return list;
}

// ---------------------------------------------------------------------------------------------------------------------
