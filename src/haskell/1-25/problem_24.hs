--                         Lexicographic permutations

-- A permutation is an ordered arrangement of objects. For example, 3124 is one
-- possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
-- are  listed  numerically  or alphabetically, we call it lexicographic order.
-- The lexicographic permutations of 0, 1 and 2 are:

--                     012   021   102   120   201   210

-- What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
-- 5, 6, 7, 8 and 9?

--                             Answer: 2783915460

import Data.List

toString :: (Integral a, Show a) => [a] -> String
toString xs = foldr (\cur acc -> (++) (show cur) acc) [] xs

lexicographicPermutations :: (Integral a, Show a) => a -> [String]
lexicographicPermutations digits = map toString permutated where
    permutated = (sort . permutations) [0..((-) digits 1)]

main :: IO()
main = do
    let digits = 10
    let nth = 1000000
    print $ (lexicographicPermutations digits) !! ((-) nth 1)
