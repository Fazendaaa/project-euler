module ProjectEuler where
    import Data.List
    import Data.List.Unique

    stringToNumbers :: String -> [Int]
    stringToNumbers [] = []
    stringToNumbers (x:xs)
        | (/=) '\n' x = (digitToInt x) : (stringToNumbers xs)
        | otherwise = (stringToNumbers xs)

    isPrime :: Integral a => a -> Bool
    isPrime number
        | (==) 2 number = True
        | (<) 2 number = null [ x | x <- [2..multiplesLimit], (==) 0 $ mod number x ]
        | otherwise = False where
            multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

    myDiff :: Integral a => a -> [a] -> [a]
    myDiff _ [] = []
    myDiff n (x:xs)
        | (==) n x = myDiff ((+) x 1) xs
        | otherwise = (++) [n..((-) x 1)] $ myDiff ((+) x 1) xs

    erasthotenesSieve :: Integral a => a -> [a]
    erasthotenesSieve limit = primes where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
        multiples = sortUniq [ mult | x <- [2..multiplesLimit], mult <- takeWhile (<= limit) [ ((*) x y) | y <- [2..limit] ]]
        primes = myDiff 2 multiples