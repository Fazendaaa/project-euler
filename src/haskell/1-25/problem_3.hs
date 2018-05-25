--                         Largest prime factor

-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?

--                         Answer: 6857

-- https://www.mathsisfun.com/prime-factorization.html

isPrime :: Integral a => a -> Bool
isPrime number
    | 2 <= number = null [ x | x <- [2..multiplesLimit], (==) 0 $ mod x number ]
    | otherwise = False where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

factors :: Integral a => a -> a -> [a]
factors _ 0 = []
factors 0 _ = []
factors first second
    | (==) 0 (mod first second) = second : factors (div first second) second
    | otherwise = []

primeFactorization :: Integral a => a -> [a]
primeFactorization number
    | 2 == number = [2]
    | 2 < number = [ f | x <- [2..number], isPrime x, f <- factors number x ] 
    | otherwise = []

main :: IO()
main = do
    let factorized = primeFactorization 600851475143
    print $ factorized !! (-) (length factorized) 2
