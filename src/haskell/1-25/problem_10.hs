--                      Summation of primes

--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

--  Find the sum of all the primes below two million.

--                      Answer: 142913828922

import Data.List
import Data.List.Unique

erasthotenesSieve :: Integral a => a -> [a]
erasthotenesSieve limit = primes where
    multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
    multiples = sortUniq [ mult | x <- [2..multiplesLimit], mult <- takeWhile (<= limit) [ ((*) x y) | y <- [2..limit] ]]
    primes = (\\) [2..limit] multiples

main :: IO()
main = do
    let limit = 2000000
    print $ erasthotenesSieve limit
