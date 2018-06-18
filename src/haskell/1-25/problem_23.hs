--                             Non-abundant sums

-- A  perfect  number  is  a number for which the sum of its proper divisors is
-- exactly  equal to the number. For example, the sum of the proper divisors of
-- 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

-- A  number  n  is  called deficient if the sum of its proper divisors is less
-- than n and it is called abundant if this sum exceeds n.

-- As  12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
-- number  that  can  be  written  as the sum of two abundant numbers is 24. By
-- mathematical  analysis, it can be shown that all integers greater than 28123
-- can be written as the sum of two abundant numbers. However, this upper limit
-- cannot  be  reduced any further by analysis even though it is known that the
-- greatest  number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.

-- Find the sum of all the positive integers which cannot be written as the sum
-- of two abundant numbers.

--                             Answer: 4179871

import Data.List

factors :: Integral a => a -> [a]
factors number = [ add | n <- [1..factorLimit], isDivisible n, add <- allFactors n ] where
    factorLimit = (truncate . sqrt . fromIntegral) number
    isDivisible num = (==) 0 (mod number num)
    allFactors num = if (>) dividend num then [num, dividend] else [num] where
        dividend = div number num

isAbundant :: Integral a => a -> Bool
isAbundant value = value < ((-) ((sum . factors) value) value)

abundant :: Integral a => a -> [a]
abundant limit = filter isAbundant [1..limit]

sumOfAbundant :: Integral a => a -> [a]
sumOfAbundant limit = [ x + y | x <- abundants, y <- takeWhile (\z -> z + x < limit) abundants ] where
    abundants = abundant limit

uniquefy :: (Eq a) => [a] -> [a]
uniquefy (x:xs) = reverse $ foldl' (\acc cur -> if (/=) (acc !! 0) cur then cur : acc else acc) [x] xs

sortUnique :: (Eq a, Ord a) => [a] -> [a]
sortUnique xs = result where
    sorted = sort xs
    result = uniquefy sorted

myDiff :: Integral a => a -> [a] -> [a]
myDiff _ [] = []
myDiff n (x:xs)
    | (==) n x = myDiff ((+) x 1) xs
    | otherwise = (++) [n..((-) x 1)] $ myDiff ((+) x 1) xs
    
nonAbundant :: Integral a => a -> [a]
nonAbundant limit = myDiff 1 sorted where
    sorted = (sortUnique . sumOfAbundant) limit

main :: IO()
main = do
    let limit = 28123
    print $ (sum . nonAbundant) limit
