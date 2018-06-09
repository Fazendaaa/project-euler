--                     Highly divisible triangular number

-- The sequence of triangle numbers is generated by adding the natural numbers.
-- So  the  7th  triangle  number  would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The
-- first ten terms would be:

--                 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

-- Let us list the factors of the first seven triangle numbers:

--                              1: 1
--                              3: 1,3
--                              6: 1,2,3,6
--                             10: 1,2,5,10
--                             15: 1,3,5,15
--                             21: 1,3,7,21
--                             28: 1,2,4,7,14,28

-- We can see that 28 is the first triangle number to have over five divisors.
-- What  is  the  value  of the first triangle number to have over five hundred
-- divisors?

--                             Answer: 76576500

import Data.List

triangleNumbers :: [Int] -> [Int]
triangleNumbers input = go 0 input where
    go _ (x:[]) = [x]
    go acc (x:xs) = newAcc : go newAcc xs where
        newAcc = (+) acc x

factors :: Int -> [Int]
factors number = [ add | n <- [1..factorLimit], isDivisible n, add <- allFactors n ] where
    factorLimit = (truncate . sqrt . fromIntegral) number
    isDivisible num = (==) 0 (mod number num)
    allFactors num = if (>) dividend num then [num, dividend] else [num] where
        dividend = div number num

triangleNumbersAndFactors :: [(Int, [Int])]
triangleNumbersAndFactors = (map (\x -> (,) (last x) x) . map factors) $ triangleNumbers [1..]

main :: IO()
main = do
    let base = 500
    -- sorting here because here's the only place there's needed.
    print $ (last . sort . snd . head . take 1 . dropWhile (\y -> (<) (length (snd y)) base)) triangleNumbersAndFactors