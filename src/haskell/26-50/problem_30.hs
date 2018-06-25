--                           Digit fifth powers

-- Surprisingly  there are only three numbers that can be written as the sum of
-- fourth powers of their digits:

--                         1634 = 1**4 + 6**4 + 3**4 + 4**4
--                         8208 = 8**4 + 2**4 + 0**4 + 8**4
--                         9474 = 9**4 + 4**4 + 7**4 + 4**4

-- As 1 = 1**4 is not a sum it is not included.

-- The sum of these numbers is 1634 + 8208 + 9474 = 19316.

-- Find  the  sum  of  all  the numbers that can be written as the sum of fifth
-- powers of their digits.

-- obs: since the problem for me is the upper bound I looked for help:
--     *   http://www.mathblog.dk/project-euler-30-sum-numbers-that-can-be-written-as-the-sum-fifth-powers-digits/

--                          Answer:

import Data.Char

toDigits :: Int -> [Int]
toDigits number = (map digitToInt . show) number

isDigitPower :: Integral a => Int -> a -> Bool
isDigitPower number power = (==) number $ (sum . map (flip (^) power)) (toDigits number)

digitPowers :: Integral a => a -> [Int]
digitPowers power = filter (flip isDigitPower power) [2..355000]

main :: IO()
main = do
    let power = 5
    print $ (sum . digitPowers) power
