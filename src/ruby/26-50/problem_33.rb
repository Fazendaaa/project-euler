=begin
                            Digit cancelling fractions

    The  fraction 49/98 is a curious fraction, as an inexperienced mathematician
    in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
    is correct, is obtained by cancelling the 9s.

    We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

    There  are  exactly four non-trivial examples of this type of fraction, less
    than  one  in  value,  and  containing  two  digits  in  the  numerator  and
    denominator.

    If  the product of these four fractions is given in its lowest common terms,
    find the value of the denominator.

    Articles that helped me out:
        *   http://www.mathblog.dk/project-euler-33-fractions-unorthodox-cancelling-method/
=end

def digit_cancelling_fractions
    denominator_product = 1
    numerator_product = 1

    for i in 1..9 do
        for denominator in 1..i-1 do
            for numerator in 1..denominator-1 do
                if ( numerator * 10 + i ) * denominator ==
                    numerator * ( i * 10 + denominator ) then
                    denominator_product *= denominator
                    numerator_product *= numerator
                end
            end
        end
    end

    return denominator_product /= denominator_product.gcd( numerator_product )
end

puts digit_cancelling_fractions
