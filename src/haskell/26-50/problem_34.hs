--                             Digit factorials

-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

-- Find  the  sum of all numbers which are equal to the sum of the factorial of
-- their digits.

-- Note: as 1! = 1 and 2! = 2 are not sums they are not included.

-- Articles that helped me out:
--     *   http://math.stackexchange.com/a/620895
--     *   https://en.wikipedia.org/wiki/Factorion

--                          Answer: 40730

import Data.Char

toDigits :: (Integral a, Show a) => a -> [Int]
toDigits number = (map digitToInt . show) number

factorial :: Integral a => a -> a
factorial number = foldr (*) 1 [2..number]

isDigitFactorial :: (Integral a, Show a) => a -> Bool
isDigitFactorial number = (==) (fromIntegral number) $ (sum . map factorial . toDigits) number

digitFactorial :: (Integral a, Show a) => [a]
digitFactorial = filter isDigitFactorial [10..3540160]

main :: IO()
main = print $ sum digitFactorial
