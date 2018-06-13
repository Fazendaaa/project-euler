#ifndef __SETINT_H__
#define __SETINT_H__

#include "../../data/data.h"
#include "../../list/int/listint.h"
#include "../../range/int/rangeint.h"

// ---------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------

ListInt * zipSetRangeIntWith (RangeInt first, RangeInt second, long int (* function) (const long int x, const long int y));

// ---------------------------------------------------------------------------------------------------------------------

#endif
