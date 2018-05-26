--                      Special Pythagorean triplet

--  A  Pythagorean  triplet  is  a  set of three natural numbers, a < b < c, for
--  which,

--                              a² + b² = c²

--  For example, 3² + 4² = 9 + 16 = 25 = 5².
--  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--  Find the product abc.

--                          Ansewer: 31875000

import Data.List

isTriplet :: Integral n => n -> n -> n -> Bool
isTriplet a b c
    | a < b && b < c = (==) ((+) (a^2) (b^2)) (c^2)
    | otherwise = False

allTriplets :: Integral n => n -> [[n]]
allTriplets hypotenuse = [ [a, b, c] | c <- [1..hypotenuse], b <- [1..c], a <- [1..b], isTriplet a b c ]

filterTriplets :: Integral n => n -> [[n]]
filterTriplets limit = filter (\[a, b, c] -> (==) limit (a + b + c)) $ allTriplets limit

main :: IO()
main = do
    let sumOfIt = 1000
    print $ (foldl' (*) 1 . head . take 1) $ filterTriplets sumOfIt
