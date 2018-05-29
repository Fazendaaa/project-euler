--                             Power digit sum

-- 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

-- What is the sum of the digits of the number 2**1000?

-- 							Answer: 1366

import Data.List
import Data.Char

main :: IO()
main = do
    print $ foldl' (+) 0 $ (map digitToInt) $ show ((^) 2 1000)
