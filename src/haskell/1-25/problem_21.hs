--                             Amicable numbers

-- Let  d(n) be defined as the sum of proper divisors of n (numbers less than n
-- which  divide  evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a
-- and b are an amicable pair and each of a and b are called amicable numbers.

-- For  example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
-- 55  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
-- 71 and 142; so d(284) = 220.

-- Evaluate the sum of all the amicable numbers under 10000.

--                             Answer: 31626

factors :: Integral a => a -> [a]
factors number = [ add | n <- [1..factorLimit], isDivisible n, add <- allFactors n ] where
    factorLimit = (truncate . sqrt . fromIntegral) number
    isDivisible num = (==) 0 (mod number num)
    allFactors num = if (>) dividend num then [num, dividend] else [num] where
        dividend = div number num

isAmicable :: Integral a => a -> Bool
isAmicable value = result where
    first = (-) ((sum . factors) value) value
    second = (-) ((sum . factors) first) first
    result = value /= first && value == second

amicableNumbers :: Integral a => a -> [a]
amicableNumbers limit = filter isAmicable [220..limit]

main :: IO()
main = do
    let limit = 10000
    print $ (sum . amicableNumbers) limit
