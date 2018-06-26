module ProjectEuler where
    import Data.List
    import Data.Char

    fibonacci :: Integral a => [a]
    fibonacci = 1 : scanl' (+) 1 fibonacci

    nthFibonacci :: Integral a => Int -> a
    nthFibonacci nth = fibonacci !! nth

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

    uniquefy :: (Eq a) => [a] -> [a]
    uniquefy (x:xs) = foldr (\cur acc -> if cur /= (acc !! 0) then cur : acc else acc) [x] xs

    sortUnique :: (Eq a, Ord a) => [a] -> [a]
    sortUnique xs = result where
        sorted = sort xs
        result = uniquefy sorted

    myDiff :: Integral a => a -> [a] -> [a]
    myDiff _ [] = []
    myDiff n (x:xs)
        | (==) n x = myDiff ((+) x 1) xs
        | otherwise = (++) [n..((-) x 1)] $ myDiff ((+) x 1) xs

    erasthotenesSieve :: Integral a => a -> [a]
    erasthotenesSieve limit = primes where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
        multiples = sortUnique [ mult | x <- [2..multiplesLimit], mult <- takeWhile (<= limit) [ ((*) x y) | y <- [2..limit] ]]
        primes = myDiff 2 multiples

    -- Without sorting to be faster.
    factors :: Int -> [Int]
    factors number = [ add | n <- [1..factorLimit], isDivisible n, add <- allFactors n ] where
        factorLimit = (truncate . sqrt . fromIntegral) number
        isDivisible num = (==) 0 (mod number num)
        allFactors num = if (>) dividend num then [num, dividend] else [num] where
            dividend = div number num

    toDigits :: (Integral a, Show a) => a -> [Int]
    toDigits number = (map digitToInt . show) number

    factorial :: Integral a => a -> a
    factorial number = foldr (*) 1 [2..number]

    mult :: Integral a => [a] -> a
    mult xs = foldr (*) 1 xs

    rotate :: Int -> [a] -> [a]
    rotate n xs = take (length xs) (drop n (cycle xs))

    joinNumbers :: (Num a, Read a, Show a) => [a] -> a
    joinNumbers xs = (read . foldl' (\acc cur -> (++) cur acc) [] . map show) xs
