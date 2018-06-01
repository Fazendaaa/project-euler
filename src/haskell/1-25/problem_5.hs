--                         Smallest multiple

--  2520  is the smallest number that can be divided by each of the numbers from
--  1 to 10 without any remainder.

--  What  is the smallest positive number that is evenly divisible by all of the
--  numbers from 1 to 20?

--                          Answer: 232792560

--  Helped me out:
--      *   http://www.mathblog.dk/project-euler-problem-5/

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

integralLog :: (Integral a, Floating b) => a -> b
integralLog = log . fromRational . toRational . fromIntegral

accumulateMultiples :: Integral a => a -> a -> a -> a
accumulateMultiples limit num acc = (*) acc ((^) num upTo) where
    upTo = truncate $ (/) (integralLog limit) (integralLog num)

smallestMultiple :: Integral a => a -> a
smallestMultiple limit = foldr (accumulateMultiples limit) 1 (erasthotenesSieve limit)

main :: IO()
main = do
    let limit = 20
    print $ smallestMultiple limit
