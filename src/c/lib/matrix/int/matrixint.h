#ifndef __MATRIXINT_H__
#define __MATRIXINT_H__

#include "../../data/data.h"
#include "../../list/int/listint.h"
#include "../matrix.h"

// ---------------------------------------------------------------------------------------------------------------------

typedef Matrix MatrixInt;

// ---------------------------------------------------------------------------------------------------------------------

MatrixInt * allocMatrixInt (void);

Boolean freeMatrixInt (MatrixInt ** matrix);

Boolean pushMatrixInt (ListInt * list);

// ---------------------------------------------------------------------------------------------------------------------

#endif
