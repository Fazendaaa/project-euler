//                             Lattice paths

// Starting  in  the top left corner of a 2×2 grid, and only being able to move
// to  the  right  and  down,  there  are  exactly 6 routes to the bottom right
// corner.

// see image at - https://projecteuler.net/project/images/p015.gif

// How many such routes are there through a 20×20 grid?

//                         Answer: 137846528820

'use strict';

import { factorial, square } from '../project_euler';

const numberOfLatticePaths = (grid: number): number => factorial(2 * grid) / square(factorial(grid));

const gridSize = 20;
console.log(numberOfLatticePaths(gridSize));
