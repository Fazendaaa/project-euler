#include <string.h>
#include "matrixint.h"

// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------

MatrixInt * allocMatrixInt (void) {
    return allocMatrix ();
}

Boolean freeMatrixInt (MatrixInt ** matrix) {
    if (isNull (matrix) || isNull ((*matrix)->list)) {
        return False;
    }

    for (Index iterator = 0; iterator < (*matrix)->size; iterator += 1) {
        freeListInt (&((*matrix)->list[iterator]));
    }

    free ((*matrix)->list);
    free ((*matrix));
    *matrix = NULL;

    return True;
}

Boolean pushMatrixInt (ListInt * list) {
    if (isNull (list)) {
        return False;
    }

    return True;
}

// ---------------------------------------------------------------------------------------------------------------------
