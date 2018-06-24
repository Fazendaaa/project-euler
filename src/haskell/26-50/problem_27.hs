--                             Quadratic primes

-- Euler discovered the remarkable quadratic formula:

--                             n² + n + 41

-- It  turns  out  that  the formula will produce 40 primes for the consecutive
-- integer   values   0≤n≤39.   However,  when n=40,  40²+40+41=40(40+1)+41  is
-- divisible  by 41, and certainly when n=41, 41²+41+41 is clearly divisible by
-- 41.

-- The  incredible formula n²−79n+1601 was discovered, which produces 80 primes
-- for  the consecutive values 0≤n≤79. The product of the coefficients, −79 and
-- 1601, is −126479.

-- Considering quadratics of the form:

--         n²+an+b, where |a|<1000 and |b|≤1000

--         where |n| is the modulus/absolute value of n
--         e.g. |11|=11 and |−4|=4

-- Find   the  product  of  the  coefficients,  a  and  b,  for  the  quadratic
-- expression that produces the maximum number of primes for consecutive values
-- of n, starting with n=0.

--                             Answer: -59231

import Data.List (maximumBy)

isPrime :: Integral a => a -> Bool
isPrime number
    | (==) 2 number = True
    | (<) 2 number = null $ filter (\x -> (==) 0 $ mod number x) [2..multiplesLimit]
    | otherwise = False where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

isQuadraticPrime :: Integral a => a -> a -> a -> Bool
isQuadraticPrime n a b = isPrime((+) ((^) n 2) ((+) ((*) a n) b))

quadraticPrimesCoef :: Integral a => a -> [(a, a, Int)]
quadraticPrimesCoef limit = [ (a, b, size) | a <- [-((-) limit 1)..((-) limit 1)],
                                             b <- [-limit..limit],
                                             size <- (:) ((length . takeWhile (\n -> isQuadraticPrime n a b)) [0..]) [],
                                             (/=) 0 size ]

bySize :: Integral a => (a, a, Int) -> (a, a, Int) -> Ordering
bySize a b = compare aSize bSize where
    (_, _, aSize) = a
    (_, _, bSize) = b

main :: IO()
main = do
    let n = 1000
    let (aMax, bMax, _) = (maximumBy bySize) (quadraticPrimesCoef n)
    print $ (*) aMax bMax
