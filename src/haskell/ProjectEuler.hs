module ProjectEuler where
    erasthotenesSieve :: Integral a => a -> [a]
    erasthotenesSieve limit = primes where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral limit):: Float)
        multiples = [ y | x <- [2..limit], y <- map (*x) [2..multiplesLimit] ]
        primes = filter (\num -> not $ elem num multiples ) [2..limit]

    reduce :: (a -> a -> a) -> [a] -> a
    reduce _ (x:[]) = x
    reduce func (x:xs) = func x $ reduce func xs
    