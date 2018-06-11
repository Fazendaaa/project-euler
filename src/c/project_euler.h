#ifndef __PROJECT_EULER_H__
#define __PROJECT_EULER_H__

// -----------------------------------------------------------------------------

typedef struct interaval {
    unsigned int start;
    unsigned int end;
    unsigned int step;
} Interval;

typedef struct intArray {
    int *array;
    unsigned long int size;
} IntArray;

// -----------------------------------------------------------------------------

IntArray * allocIntArray (const long unsigned int length);

// -----------------------------------------------------------------------------

unsigned long int * range (const Interval options);

long int sum (const IntArray * array);

// -----------------------------------------------------------------------------

#endif
