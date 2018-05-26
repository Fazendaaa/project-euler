--                      Summation of primes

--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

--  Find the sum of all the primes below two million.

--                      Answer: 142913828922

import Data.List
import Data.List.Unique

myDiff :: Integral a => a -> [a] -> [a]
myDiff _ [] = []
myDiff n (x:xs)
    | (==) n x = myDiff ((+) x 1) xs
    | otherwise = (++) [n..((-) x 1)] $ myDiff ((+) x 1) xs

erasthotenesSieve :: Integral a => a -> [a]
erasthotenesSieve limit = primes where
    multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
    multiples = sortUniq [ mult | x <- [2..multiplesLimit], mult <- takeWhile (<= limit) [ ((*) x y) | y <- [2..limit] ]]
    primes = myDiff 2 multiples

main :: IO()
main = do
    let limit = 2000000
    print $ foldl' (+) 0 $ erasthotenesSieve limit
