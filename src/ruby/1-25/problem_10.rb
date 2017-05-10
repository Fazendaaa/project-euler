=begin
                        Summation of primes

    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    Find the sum of all the primes below two million.

                        Answer: 142913828922
=end

#!/usr/bin/ruby

require_relative '../project_euler'

puts erastosthenes_sieve( 2_000_000 ).reduce( :+ )
