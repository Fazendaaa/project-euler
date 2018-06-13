#include <stdlib.h>
#include "project_euler.h"

Data * sumInt (Data * acc, const Data * cur) {
    return (Data *) (castInt (acc) += castInt (cur));
}

Boolean isIntEven (const Data * value) {
    return 0 == (*((long int *) value) % 2);
}
