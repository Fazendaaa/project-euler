--                             Lattice paths

-- Starting  in  the top left corner of a 2×2 grid, and only being able to move
-- to  the  right  and  down,  there  are  exactly 6 routes to the bottom right
-- corner.

-- see image at - https://projecteuler.net/project/images/p015.gif

-- How many such routes are there through a 20×20 grid?

--                         Answer: 137846528820

-- Helped me out:
--     * http://www.robertdickau.com/lattices.html
--     * http://www.robertdickau.com/manhattan.html

import Data.List

factorial :: Integral a => a -> a
factorial number = foldl' (*) 1 [2..number]

numberOfLatticePaths :: Integral a => a -> a
numberOfLatticePaths n = div (factorial ((*) 2 n)) ((^) (factorial n) 2)

main :: IO()
main = do
    print $ numberOfLatticePaths 20
