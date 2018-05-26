module ProjectEuler where
    isPrime :: Integral a => a -> Bool
    isPrime number
        | (==) 2 number = True
        | (<) 2 number = null [ x | x <- [2..multiplesLimit], (==) 0 $ mod number x ]
        | otherwise = False where
            multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

    erasthotenesSieve :: Integral a => a -> [a]
    erasthotenesSieve limit = primes where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
        multiples = [ y*x | x <- [2..multiplesLimit], y <- [2..multiplesLimit] ]
        primes = filter (\num -> not $ elem num multiples ) [2..limit]
