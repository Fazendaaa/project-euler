=begin
                            Smallest multiple

    2520  is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.

    What  is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?

                            Answer: 232792560

    Helped me out:
        *   http://www.mathblog.dk/project-euler-problem-5/
=end

#!/usr/bin/ruby

require_relative '../project_euler'

def smallest_multiple( limit )
    limit_log = Math::log10( limit )
    p = erastosthenes_sieve( limit )
    result = 1

    for i in 0..p.length-1
        a = ( ( limit_log / Math::log10( p[ i ] ) ).floor ).to_i
        result = result * ( p[ i ] ** a )
    end

    return result
end

puts smallest_multiple( 20 )
