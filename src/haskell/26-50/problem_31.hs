--                             Coin sums

-- In  England the currency is made up of pound, £, and pence, p, and there are
-- eight coins in general circulation:

--         1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

-- It is possible to make £2 in the following way:

--             1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

-- How many different ways can £2 be made using any number of coins?

-- Articles that helped me out:
--     *   http://www.geeksforgeeks.org/dynamic-programming-set-7-coin-change/

--                          Answer: 73682

coinSums :: Integral a => [a] -> Int -> a -> a
coinSums coins size value
    | (==) 0 value = 1
    | (>)  0 value = 0
    | (>=) 0 size && (<=) 1 value = 0
    | otherwise = (+) left right where
        left  = coinSums coins ((-) size 1) value
        right = coinSums coins size ((-) value (coins !! ((-) size 1)))

main :: IO()
main = do
    let coins = [1, 2, 5, 10, 20, 50, 100, 200]
    print $ coinSums coins (length coins) 200
