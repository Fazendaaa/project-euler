--                         Number spiral diagonals

-- Starting  with the number 1 and moving to the right in a clockwise direction
-- a 5 by 5 spiral is formed as follows:

--                             21 22 23 24 25
--                             20  7  8  9 10
--                             19  6  1  2 11
--                             18  5  4  3 12
--                             17 16 15 14 13

-- It can be verified that the sum of the numbers on the diagonals is 101.

-- What  is  the  sum  of the numbers on the diagonals in a 1001 by 1001 spiral
-- formed in the same way?

--                             Answer: 669171001

import Data.List

makeDiagonals :: Integral a => a -> a -> [a]
makeDiagonals final side = map (\x -> (-) final ((*) side x)) [1..4]

spiralDiagonals :: Integral a => a -> [a]
spiralDiagonals limit = sort $ (:) ((^) limit 2) [ diagonals | x <- [3, 5..limit], diagonals <- makeDiagonals ((^) x 2) ((-) x 1) ]

main :: IO()
main = do
    let side = 1001
    print $ (sum . spiralDiagonals) side
