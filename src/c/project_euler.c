#include <stdlib.h>
#include "project_euler.h"

static unsigned long int * __range (const Interval options) {
    const unsigned long int length = options.end - options.start;
    unsigned long * range = malloc((sizeof(int) * length));

    return malloc((sizeof(int) * length));
}

unsigned long int * range (const Interval options) {
    if (0 == options.end) {
        return NULL;
    }

    return __range(options);
}

long int sum (const IntArray * array) {

}
