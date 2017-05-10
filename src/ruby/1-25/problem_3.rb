=begin
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
=end

#!/usr/bin/ruby

require_relative '../project_euler'

def largest_prime( max )
    return prime_factors( max ).sort.pop
end

puts largest_prime( 600851475143 );
