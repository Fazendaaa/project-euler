-- 						Multiples of 3 and 5

-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we
-- get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

-- 						Answer: 233168

import Data.List

isDivisibleBy :: (Integral a) => a -> [a] -> Bool
isDivisibleBy _ [] = False
isDivisibleBy val (x:xs) = (==) 0 (mod val x) || isDivisibleBy val xs

multiplesOfBelow :: (Integral a) => [a] -> a -> [a]
multiplesOfBelow multiples limit = filter (\x -> isDivisibleBy x multiples) [1..((-) limit 1)]

main :: IO()
main = do
    print $ foldl' (+) 0 $ multiplesOfBelow [3, 5] 1000
