--                              10001st prime

--  By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
--  that the 6th prime is 13.

--  What is the 10 001st prime number?

--                              Answer: 104743

isPrime :: Integral a => a -> Bool
isPrime number
    | 2 <= number = null [ x | x <- [2..multiplesLimit], (==) 0 $ mod number x ]
    | otherwise = False where
        multiplesLimit = (+) 1 $ truncate ((sqrt $ fromIntegral number):: Float)

main :: IO()
main = do
    let nth = 10001
    print $ (last . take ((-) nth 1)) [ number | number <- [2..], isPrime number ] 
