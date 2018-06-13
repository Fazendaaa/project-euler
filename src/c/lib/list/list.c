#include <stdlib.h>
#include <string.h>
#include "list.h"

// ---------------------------------------------------------------------------------------------------------------------

static ListElement * allocElement (Data * data) {
    ListElement * new = NULL;

    if (isNotNull (data)) {
        new = (ListElement *) malloc (sizeof (ListElement));
    } if (isNotNull (new)) {
        new->data = data;
        new->next = NULL;
        new->prev = NULL;
    }

    return new;
}

static Boolean addElement (List * list, Data * data, ListElement * prev, ListElement * next) {
    ListElement * new = allocElement(data);

    if (isNull (new)) {
        return False;
    } if (isNotNull (prev)) {
        prev->next = new;
    } if (isNotNull (next)) {
        next->prev = new;
    } 
    
    new->prev = prev;
    new->next = next;
    
    if (isNull(prev)) {
        list->head = new;
    } if (isNull(next)) {
        list->tail = new;
    } 

    list->length += 1;

    return True;
}

// Use maybe to improve to insertOrdered.
/*
static Boolean insertElementNext (List * list, ListElement * element, Data * data) {
    if (isNull (list) || isNull (element) || isNull(data)) {
        return False;
    } if (element == list->tail || 0 == list->length) {
        return push (list, data);
    } 

    return addElement (list, data, element, element->next);
}

static Boolean insertElementPrev (List * list, ListElement * element, Data * data) {
    if (isNull (list) || isNull (element) || isNull(data)) {
        return False;
    } if (element == list->head || 0 == list->length) {
        return unshift (list, data);
    }

    return addElement (data, data, element->prev, element);
}
*/

static Data * fetchData (List * list, ListElement * element) {
    ListElement * prev = NULL, * next = NULL;
    Data * data = NULL;

    if (isNull (list) || isNull (element)) {
        return NULL;
    } if (list->head == element) {
        list->head = element->next;
    } if (list->tail == element) {
        list->tail = element->prev;        
    } if (isNotNull (element->prev)) {
        prev = element->prev;
    } if (isNotNull (element->next)) {
        next = element->next;
    } if (isNotNull (prev)) {
        prev->next = element->next;
    } if (isNotNull (next)) {
        next->prev = element->prev;
    }

    data = element->data;
    list->length -= 1;
    free (element);

    return data;
}

static ListElement * fetchElement (List* list, Data * data) {
    ListElement * toCompare = list->head;
    Comparisson result = list->match(data, toCompare->data);

    while (isNotNull(toCompare) && not(result == Equal)) {
        toCompare = toCompare->next;
        result = list->match(data, toCompare->data);
    }

    return toCompare;
}

static Boolean excludeElement (List* list, ListElement * element) {
    if (isNull (list) || isNull (element) || isNull (element->data)) {
        return False;
    }
        
    return list->destroy(fetchData (list, element));
}

static Data * lookDataFromEnd (List * list, Index pos) {
    ListElement * element = list->tail;

    for (Index iterator = list->length; iterator != pos; iterator -= 1) {
        element = element->prev;
    }

    return element->data;
}

static Data * lookDataFromStart (List * list, Index pos) {
    ListElement * element = list->head;

    for (Index iterator = 0; iterator != pos; iterator += 1) {
        element = element->next;
    }

    return element->data;
}

// ---------------------------------------------------------------------------------------------------------------------

List * allocList (Boolean (* destroy) (Data * data), Comparisson (* match) (const Data * key1, const Data * key2)) {
    List * list = (List *) malloc (sizeof (List));

    if (isNotNull (list)) {
        list->length = 0;

        list->match = match;
        list->destroy = destroy;

        list->head = NULL;
        list->tail = NULL;
    }

    return list;
}

Boolean freeList (List ** list) {
    if (isNull (list) || isNull (*list) || isNull ((*list)->destroy)) {
        return False;
    }

    while (0 != (*list)->length) {
        if (not (excludeElement ((*list), (*list)->tail))) {
            return False;
        }
    }

    free (*list);
    *list = NULL;

    return True;
}

Boolean includes (List * list, Data * data) {
    if (isNull (list) || isNull(list->match) || isNull (data)) {
        return False;
    }

    return isNotNull (fetchElement (list, data));
}

Boolean exclude (List * list, Data * data) {
    if (isNull (list) || isNull(list->match) || isNull(list->destroy) || isNull (data)) {
        return False;
    }

    return list->destroy(fetchElement (list, data));
}

Data * postion (List * list, Index pos) {    
    if (isNull (list) || 0 >= pos || list->length < pos) {
        return NULL;
    } if (list->length / 2 <= pos) {
        return lookDataFromEnd (list, pos);
    }

    return lookDataFromStart (list, pos);
}

Data * pop (List * list) {
    return fetchData (list, list->tail);
}

Data * shift (List * list) {
    return fetchData (list, list->head);
}

Boolean push (List * list, Data * data) {
    if (isNull (list) || isNull (data)) {
        return False;
    }

    return addElement (list, data, list->tail, NULL);
}

Boolean unshift (List * list, Data * data) {
    if (isNull (list) || isNull (data)) {
        return False;
    }

    return addElement (list, data, NULL, list->head);
}

Boolean insertOrdered (List * list, Data * data);

Boolean sort (List * list);

Data * reduce (const List * list, Data * (* operation) (Data * acc, const Data * cur), Data * initial) {
    ListElement * next = NULL;
    
    if (isNull (list) || isNull(operation) || isNull(initial)) {
        return NULL;
    }

    next = list->head;

    while (isNotNull(next)) {
        operation(initial, next->data);
        next = next->next;
    }

    return initial;
}

List * filter (const List * list, Boolean (* match) (const Data * value), List * filtered, size_t size) {
    Data * toAdd = NULL;

    if (isNull (list) || isNull (match) || isNull(filtered)) {
        return NULL;
    }

    for (ListElement * element = list->head; isNotNull (element); element = element->next) {
        if (match (element->data)) {
            toAdd = malloc (size);
            memcpy (toAdd, element->data, size);
            push (filtered, toAdd);
        }
    }

    return filtered;
}
