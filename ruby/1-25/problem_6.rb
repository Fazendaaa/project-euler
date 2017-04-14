=begin
                        Sum square difference

    The sum of the squares of the first ten natural numbers is,

                    1² + 2² + ... + 10² = 385

    The square of the sum of the first ten natural numbers is,

                (1 + 2 + ... + 10)² = 55² = 3025

    Hence the difference between the sum of the squares of the first ten natural
    numbers and the square of the sum is 3025 − 385 = 2640.
    Find  the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum.
=end

#!/usr/bin/ruby

def sum_square_diff( limit )
    result = 0
    numbers = ( 1..limit )

    if 1 < limit then
        sum_1 = numbers.inject { | result, element | result + element }
        sum_2 = numbers.inject { | result, element | result + element**2 }
        result = sum_1**2 - sum_2
    end

    return result
end

puts sum_square_diff( 100 )
