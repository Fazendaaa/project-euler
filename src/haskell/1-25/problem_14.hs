--                     Longest Collatz sequence

-- The  following  iterative  sequence  is  defined  for  the  set  of positive
-- integers:

--                         n → n/2 (n is even)
--                         n → 3n + 1 (n is odd)

-- Using  the  rule  above  and  starting  with  13,  we generate the following
-- sequence:

--             13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

-- It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
-- contains 10 terms. Although it has not been proved yet (Collatz Problem), it
-- is thought that all starting numbers finish at 1.

-- Which starting number, under one million, produces the longest chain?

-- NOTE: Once the chain starts the terms are allowed to go above one million.

--                             Answer: 837799

import Data.List

collatzSequence :: Int -> [Int]
collatzSequence 1 = [1]
collatzSequence number
    | (<) 1 number = if even number then isEven else isOdd
    | otherwise = [] where
        isEven = number : collatzSequence (div number 2)
        isOdd = number : collatzSequence ((+) ((*) 3 number) 1)
    
main :: IO()
main = do
    let limit = 1000000
    -- To allow less usage of memory, only stores the size of the sequence and it's starting number.
    print $ (fst . last . sortBy (\x y -> compare (snd x) (snd y)) . map (\x -> (,) x ((length . collatzSequence) x))) [1..limit]
