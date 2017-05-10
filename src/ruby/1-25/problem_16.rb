=begin
                                Power digit sum

    2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

    What is the sum of the digits of the number 2**1000?

    							Answer: 1366
=end

#!/usr/bin/ruby

def power_digit_sum( base, power )
    return ( base**power ).to_s.split('').map( &:to_i ).reduce( :+) 
end

puts power_digit_sum( 2, 1_000 )
