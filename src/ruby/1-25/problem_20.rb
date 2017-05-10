=begin
                            Factorial digit sum

    n! means n × (n − 1) × ... × 3 × 2 × 1

    For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
    digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

    Find the sum of the digits in the number 100!

                            Answer: 648
=end

#!/usr/bin/ruby

def factorial_digit_sum( limit )
    return ( 1..limit ).reduce( :* ).to_s.split( '' ).map( &:to_i ).reduce( :+ )
end

puts factorial_digit_sum( 100 )
