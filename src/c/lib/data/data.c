#include <stdlib.h>
#include "data.h"

Boolean isNull (const void * value) {
    return NULL == value;
}

Boolean isNotNull (const void * value) {
    return NULL != value;
}

Boolean not (const Boolean value) {
    return !value;
}
