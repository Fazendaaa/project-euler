
=begin
                            Champernowne's constant

    An irrational decimal fraction is created by concatenating the positive
    integers:

                    0.123456789101112131415161718192021...

    It can be seen that the 12th digit of the fractional part is 1.

    If dn represents the nth digit of the fractional part, find the value of the
    following expression.

            d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

    Articles that helped me out:
        *   https://en.wikipedia.org/wiki/Champernowne_constant
=end

def champernowne_constant( indexes )
    champernowne = ( "1".."#{ indexes.max }" ).to_a.join( '' )
    return indexes.map { | i | champernowne[ i - 1 ].to_i }
end

puts champernowne_constant( [ 1, 10, 100, 1_000, 10_000, 100_000, 1_000_000 ] ).
     reduce( :* )
