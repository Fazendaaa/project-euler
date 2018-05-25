--                         Largest palindrome product

-- A  palindromic  number  reads the same both ways. The largest palindrome made
-- from the product of two 2-digit numbers is 9009 = 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.

--                             Answer: 906609

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x:xs) = if (==) x (last xs) then (isPalindrome . init) xs else False

productOfNDigits :: Integer -> [String]
productOfNDigits number = [ show(x*y) | x <- [lower..upper], y <- [x..upper] ] where
    lower = 10^((-) number 1) :: Integer
    upper = (-) (10^number) 1 :: Integer

main :: IO()
main = do
    let digits = 3 :: Integer
    print $ maximum $ map (read::String->Int) $ filter isPalindrome $ productOfNDigits digits
