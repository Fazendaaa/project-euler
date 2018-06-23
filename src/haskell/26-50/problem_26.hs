--                             Reciprocal cycles

-- A  unit  fraction contains 1 in the numerator. The decimal representation of
-- the unit fractions with denominators 2 to 10 are given:

--     1/2	    = 	0.5
--     1/3	    = 	0.(3)
--     1/4	    = 	0.25
--     1/5	    = 	0.2
--     1/6	    = 	0.1(6)
--     1/7	    = 	0.(142857)
--     1/8	    = 	0.125
--     1/9	    = 	0.(1)
--     1/10	= 	0.1

-- Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
-- seen that 1/7 has a 6-digit recurring cycle.

-- Find the value of d < 1000 for which 1/d contains the longest recurring
-- cycle in its decimal fraction part.

--                             Answer: 983

-- obs: article that helped me out:
--  *   https://zach.se/project-euler-solutions/26/

import Data.List (maximumBy)

isCycle :: Integral a => a -> a -> Bool
isCycle x limit = (==) 0 (rem ((-) ((^) 10 x) 1) limit)

cycleLength :: Integral a => a -> a
cycleLength limit = fst $ maximumBy (\a b -> compare (snd a) (snd b)) $ map (\x -> (x, go x)) [1, 3..limit] where
    go value
        | even value || (==) 0 (rem value 5) = 0
        | otherwise = (head . filter (flip isCycle value)) [1..value]

main :: IO ()
main = do
    let limit = 1000
    print $ cycleLength limit
