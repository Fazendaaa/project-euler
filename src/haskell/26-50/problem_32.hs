--                             Pandigital products

-- We shall say that an n-digit number is pandigital if it makes use of all the
-- digits  1  to  n  exactly once; for example, the 5-digit number, 15234, is 1
-- through 5 pandigital.

-- The  product  7254  is unusual, as the identity, 39 × 186 = 7254, containing
-- multiplicand, multiplier, and product is 1 through 9 pandigital.

-- Find  the sum of all products whose multiplicand/multiplier/product identity
-- can be written as a 1 through 9 pandigital.

-- HINT:  Some products can be obtained in more than one way so be sure to only
-- include it once in your sum.

-- Articles that helped me out:
--     *   https://zach.se/project-euler-solutions/32/
--         This one helped a lot because I was using 10 000 as limit instead of
--         4 999 and 99

--                              Answer: 45228

import Data.Char
import Data.List

uniquefy :: (Eq a) => [a] -> [a]
uniquefy (x:xs) = foldr (\cur acc -> if cur /= (acc !! 0) then cur : acc else acc) [x] xs

sortUnique :: (Eq a, Ord a) => [a] -> [a]
sortUnique xs = result where
    sorted = sort xs
    result = uniquefy sorted

toDigits :: (Integral a, Show a) => a -> [Int]
toDigits number = (map digitToInt . show) number

isPandigital :: (Integral a, Show a) => a -> a -> Bool
isPandigital x y = (==) [1, 2, 3, 4, 5, 6, 7, 8, 9] total where
    first  = toDigits x
    second = toDigits y
    mult   = toDigits ((*) x y)
    total  = sort ((++) ((++) first second) mult)

pandigitalProdutcs :: (Integral a, Show a) => [a]
pandigitalProdutcs = sortUnique [ ((*) a b) | a <- [1..4999], b <- [1..99], isPandigital a b ]

main :: IO()
main =
    print $ sum pandigitalProdutcs
