--                      Sum square difference

--  The sum of the squares of the first ten natural numbers is,

--                  1² + 2² + ... + 10² = 385

--  The square of the sum of the first ten natural numbers is,

--              (1 + 2 + ... + 10)² = 55² = 3025

--  Hence the difference between the sum of the squares of the first ten natural
--  numbers and the square of the sum is 3025 − 385 = 2640.

--  Find  the difference between the sum of the squares of the first one hundred
--  natural numbers and the square of the sum.

--                          Answer: 25164150

import Data.List

main :: IO()
main = do
    let limit = 100 :: Integer
    let theSumSquare = foldl' (+) 0 $ map (^2) [1..limit]
    let theSquareSum = (^2) $ foldl' (+) 0 [1..limit]
    print $ (-) theSquareSum theSumSquare
