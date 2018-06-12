#ifndef __DATA_H__
#define __DATA_H__

typedef unsigned int Index;

typedef int Boolean;

#define False   0
#define True    1

typedef int Comparisson;

#define Lesser  -1
#define Equal    0
#define Greater  1

// -----------------------------------------------------------------------------

Boolean isNull (const void * value);

Boolean isNotNull (const void * value);

Boolean not (const Boolean value);

#endif
