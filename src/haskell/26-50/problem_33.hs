--                         Digit cancelling fractions

-- The  fraction 49/98 is a curious fraction, as an inexperienced mathematician
-- in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
-- is correct, is obtained by cancelling the 9s.

-- We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

-- There  are  exactly four non-trivial examples of this type of fraction, less
-- than  one  in  value,  and  containing  two  digits  in  the  numerator  and
-- denominator.

-- If  the product of these four fractions is given in its lowest common terms,
-- find the value of the denominator.

-- Articles that helped me out:
--     *   http://www.mathblog.dk/project-euler-33-fractions-unorthodox-cancelling-method/

--                              Answer: 100

isCancellingFactions :: Integral a => a -> a -> a -> Bool
isCancellingFactions index numerator denominator = (==) left right where
    left = (*) denominator ((+) index ((*) numerator 10))
    right = (*) numerator ((+) denominator ((*) index 10))

digitCancellingFractions :: Integral a => a
digitCancellingFractions = div denoProd (gcd denoProd numProd) where
    values = [ (denominator, numerator ) | index <- [1..9],
                                           denominator <- [1..((-) index 1)],
                                           numerator <- [1..((-) denominator 1)],
                                           isCancellingFactions index numerator denominator ]
    (denoProd, numProd) = foldr (\cur acc -> (,) ((*) (fst acc) (fst cur)) ((*) (snd acc) (snd cur))) (1, 1) values


main :: IO()
main =
    print $ digitCancellingFractions
