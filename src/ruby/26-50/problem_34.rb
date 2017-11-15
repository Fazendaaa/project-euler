=begin
                                Digit factorials

    145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

    Find  the  sum of all numbers which are equal to the sum of the factorial of
    their digits.

    Note: as 1! = 1 and 2! = 2 are not sums they are not included.

    Articles that helped me out:
        *   http://math.stackexchange.com/a/620895
        *   https://en.wikipedia.org/wiki/Factorion
=end

#=begin
def digit_factorials
    matches = []

    for number in 10..2_540_160 do
        matches.push( number ) if number.to_s.split( // ).map( &:to_i ).
                                  map { | element | ( 1..element ).reduce( 1, :* ) }.
                                  reduce( :+ ) == number
    end

    return matches
end

puts digit_factorials.reduce( :+ )
