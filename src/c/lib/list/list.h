#ifndef __LIST_H__
#define __LIST_H__

#include "../data/data.h"

// -----------------------------------------------------------------------------

typedef void Data;

typedef struct listElement {
    Data * data;

    struct listElement * next, * prev;
} ListElement;

typedef struct list {
    unsigned int length;

    ListElement * head, * tail;

    Boolean (* destroy) (Data * data);
    Comparisson (* match) (const Data * key1, const Data * key2);
} List;

// -----------------------------------------------------------------------------

List * allocList (Boolean (* destroy) (Data * data), Comparisson (* match) (const Data * key1, const Data * key2));

Boolean freeList (List ** list);

Boolean includes (List * list, Data * data);

Boolean exclude (List * list, Data * data);

Data * pop (List * list);

Data * shift (List * list);

Boolean push (List * list, Data * data);

Boolean unshift (List * list, Data * data);

Boolean insertOrdered (List * list, Data * data);

Boolean sort (List * list);

Data * reduce (const List * list, Data (* operation) (const Data * acc, const Data * cur), Data * initial);

// -----------------------------------------------------------------------------

#endif
