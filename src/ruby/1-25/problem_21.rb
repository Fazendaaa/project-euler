=begin
                                Amicable numbers

    Let  d(n) be defined as the sum of proper divisors of n (numbers less than n
    which  divide  evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a
    and b are an amicable pair and each of a and b are called amicable numbers.

    For  example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
    55  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
    71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under 10000.

                                Answer: 31626

    Helped me out:
        *   https://en.wikipedia.org/wiki/Amicable_numbers
=end

#!/usr/bin/ruby

require_relative '../project_euler'
        
def amicable_numbers( limit )
    amicable = []
    hash = Hash.new( false )

    # => the first pair of amicable numbers are 220 and 284
    return [] if 220 > limit

    for i in 220..limit do
        other = all_divisors( i )[ 0..-2 ].reduce( :+ )
        amicable.push( i ) if i != other &&
                              all_divisors( other )[ 0..-2 ].reduce( :+ ) == i
    end

    return amicable
end

puts amicable_numbers( 10_000 ).reduce( :+ )