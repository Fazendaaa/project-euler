--                             Names scores

-- Using  problem_22.txt,  a  46K text file containing over five-thousand first
-- names,  begin  by  sorting  it into alphabetical order. Then working out the
-- alphabetical  value  for  each name, multiply this value by its alphabetical
-- position in the list to obtain a name score.

-- For  example,  when the list is sorted into alphabetical order, COLIN, which
-- is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
-- would obtain a score of 938 × 53 = 49714.

-- What is the total of all the name scores in the file?

--                         Answer: 871198282

import Data.List
import Data.Char
import Text.Regex

parseInput :: String -> [String]
parseInput input = words $ subRegex (mkRegex "(\",\")|(\")") input " "

calculateScore :: String -> Int -> (String, Int)
calculateScore word index = (word, score) where
    wordValue = sum (map (\x -> (-) ((ord . toLower) x) 96) word)
    score = (*) index wordValue

namesScore :: [String] -> [(String, Int)]
namesScore names = go (sort names) 1 where
    go [] _ = []
    go (x:xs) index = (:) (calculateScore x index) (go xs (index + 1))

sumNamesScore :: [(String, Int)] -> Int
sumNamesScore xs = foldl' (\acc cur -> (+) acc (snd cur)) 0 xs

main :: IO()
main = do
    input <- readFile "input/problem_22.txt"
    print $ (sumNamesScore . namesScore . parseInput) input
