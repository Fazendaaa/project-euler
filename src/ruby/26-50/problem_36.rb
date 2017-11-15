=begin
                            Double-base palindromes

    The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

    Find the sum of all numbers, less than one million, which are palindromic in
    base 10 and base 2.

    (Please  note  that  the palindromic number, in either base, may not include
    leading zeros.)
=end

def double_base_palindromes( limit )
    matches = []

    for number in 1..limit do
        if number.to_s == number.to_s.reverse then
            matches.push( number ) if number.to_s( 2 ) ==
                                      number.to_s( 2 ).reverse
        end
    end

    return matches.map( &:to_i )
end

puts double_base_palindromes( 1_000_000 ).reduce( :+ )
