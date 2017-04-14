=begin
                                Pandigital products

    We shall say that an n-digit number is pandigital if it makes use of all the
    digits  1  to  n  exactly once; for example, the 5-digit number, 15234, is 1
    through 5 pandigital.

    The  product  7254  is unusual, as the identity, 39 × 186 = 7254, containing
    multiplicand, multiplier, and product is 1 through 9 pandigital.

    Find  the sum of all products whose multiplicand/multiplier/product identity
    can be written as a 1 through 9 pandigital.

    HINT:  Some products can be obtained in more than one way so be sure to only
    include it once in your sum.

    Articles that helped me out:
        *   https://zach.se/project-euler-solutions/32/
            This one helped a lot because I was using 10 000 as limit instead of
            4 999 and 99
=end

def pandigital_products
    matches = []

    for a in 1..4_999 do
        for b in 1..99 do
            pandigital = [ a.to_s + b.to_s + ( a*b ).to_s, a*b ]
            matches.push( pandigital[ 1 ] ) if 9 == pandigital[ 0 ].length &&
                            "123456789" == pandigital[ 0 ].each_char.sort.join
        end
    end

    return matches.uniq
end

puts pandigital_products.reduce( :+ )
