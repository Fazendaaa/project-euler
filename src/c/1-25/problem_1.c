/*
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
*/

#include <stdlib.h>
#include <stdio.h>
#include "../lib/list/int/listint.h"

int main (int argc, char ** argv) {
    ListInt * list = allocListInt();

    if (True == pushListInt (list, 3) && True == pushListInt (list, 5)) {
        printf ("Pushed.\n");
    } else {
        printf ("Error.\n");
    }

    printf ("List length: %d.\n", list->length);
    printf ("Hello, World, %ld.\n", (long int) &(list->tail->data));

    freeListInt (&list);

    return 0;
}
