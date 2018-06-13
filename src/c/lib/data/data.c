#include <stdlib.h>
#include "data.h"

Boolean isNull (const Data * value) {
    return NULL == value;
}

Boolean isNotNull (const Data * value) {
    return NULL != value;
}

Boolean not (const Boolean value) {
    return !value;
}
