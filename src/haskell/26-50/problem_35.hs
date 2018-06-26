{-# LANGUAGE FlexibleContexts #-}
--                             Circular primes

-- The  number,  197,  is  called a circular prime because all rotations of the
-- digits: 197, 971, and 719, are themselves prime.

-- There  are  thirteen  such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
-- 71, 73, 79, and 97.

-- How many circular primes are there below one million?

--                              Answer:

import Data.List
import Data.Char

-- Copied     from    https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Haskell
-- becaus my version consumes a lot of memory
import Data.Array.Unboxed
 
primesToA m = sieve 3 (array (3,m) [(i,odd i) | i<-[3..m]] :: UArray Int Bool)
  where
    sieve p a 
      | p*p > m   = 2 : [i | (i,True) <- assocs a]
      | a!p       = sieve (p+2) $ a//[(i,False) | i <- [p*p, p*p+2*p..m]]
      | otherwise = sieve (p+2) a

--------------------------------------------------------------------------------

toDigits :: (Integral a, Show a) => a -> [Int]
toDigits number = (map digitToInt . show) number

rotate :: [a] -> [a]
rotate (x:xs) = (++) xs [x]

joinNumbers :: (Num a, Read a, Show a) => [a] -> a
joinNumbers xs = (read . foldr (\cur acc -> (++) cur acc) [] . map show) xs

allRotations :: (Integral a, Read a, Show a) => a -> [Int]
allRotations number = map joinNumbers rotated where
    digits = toDigits number
    rotated = take (length digits) (iterate rotate digits)

isPrime :: (Integral a, Read a, Show a) => a -> Bool
isPrime number
    | (==) 2 number = True
    | (<) 2 number = null [ x | x <- [2..multiplesLimit], (==) 0 $ mod number x ]
    | otherwise = False where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

isCircularPrime :: (Integral a, Read a, Show a) => a -> Bool
isCircularPrime number = (and . map isPrime . allRotations) number

circularPrimes :: (Integral a, Read a, Show a) => a -> [a]
circularPrimes limit = filter isCircularPrime primesBellow where
    primesBellow = map (fromIntegral) $ primesToA (fromIntegral limit)

main :: IO()
main = do
    let limit = 1000000
    print $ (length . circularPrimes) limit
