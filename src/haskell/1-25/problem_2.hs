-- 						Even Fibonacci numbers

-- Each  new term in the Fibonacci sequence is generated by adding the previous
-- two terms. By starting with 1 and 2, the first 10 terms will be:

-- 				1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

-- By  considering  the  terms  in  the  Fibonacci sequence whose values do not
-- exceed four million, find the sum of the even-valued terms.

-- 							Answer: 4613732

import Data.List

-- Inifinite recursion.
fibonacci :: Integral a => [a]
fibonacci = 1 : scanl' (+) 1 fibonacci

nthFibonacci :: Integral a => Int -> a
nthFibonacci nth = (!!) fibonacci nth

takeFibWhile :: (Integral a) => a -> [a]
takeFibWhile takeLimit = takeWhile (< takeLimit) [nthFibonacci x | x <- [1..]]

evenFibLimit :: (Integral a) => a -> [a]
evenFibLimit limit = (filter even . takeFibWhile) limit

main :: IO()
main = do
    let limit = 4000000
    print $ (foldl' (+) 0 . evenFibLimit) limit

