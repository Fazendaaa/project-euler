--                     Factorial digit sum

-- n! means n × (n − 1) × ... × 3 × 2 × 1

-- For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
-- digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

-- Find the sum of the digits in the number 100!

--                         Answer: 648

import Data.List
import Data.Char

factorial :: Integral a => a -> a
factorial value = foldl' (*) 1 [1..value]

factorialDigitSum :: (Integral a, Show a) => a -> Int
factorialDigitSum value = summed where
    factorialized = factorial value
    digits = map digitToInt $ show factorialized
    summed = foldl' (+) 0 digits

main :: IO()
main = do
    let number = 100
    print $ factorialDigitSum number
