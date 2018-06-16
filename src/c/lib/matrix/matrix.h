#ifndef __MATRIX_H__
#define __MATRIX_H__

#include "../data/data.h"
#include "../list/list.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef struct matrix {
    List ** list;
    Index size;
} Matrix;

// ---------------------------------------------------------------------------------------------------------------------

Matrix * allocMatrix (void);

Boolean freeMatrix (Matrix ** matrix);

// ---------------------------------------------------------------------------------------------------------------------

#endif
