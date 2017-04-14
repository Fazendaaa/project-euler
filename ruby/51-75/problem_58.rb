=begin
									Spiral primes
	
	Starting  with 1 and spiralling anticlockwise in the following way, a square
	spiral with side length 7 is formed.

								37 36 35 34 33 32 31
								38 17 16 15 14 13 30
								39 18  5  4  3 12 29
								40 19  6  1  2 11 28
								41 20  7  8  9 10 27
								42 21 22 23 24 25 26
								43 44 45 46 47 48 49

	It  is  interesting to  note that the odd squares lie along the bottom right
	diagonal, but what is more interesting is that 8 out of the 13 numbers lying
	along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.

	If  one  complete  new  layer  is  wrapped around the spiral above, a square
	spiral with side length 9 will be formed. If this process is continued, what
	is  the side length of the square spiral for which the ratio of primes along
	both diagonals first falls below 10%?

	Helped me out:
		*	See problem 28 solution
=end

require_relative '../project_euler'

def spiral_primes( floor )
	# => "i" is the increment that each value recieves on each edge from another
    i = 0
    # => 1  is not a prime but it's parte of the diagonals, that's why the total
    # => begins at 1 element, not the 1 value
    total = 1
    # => number will be each diagonal number
    number = 1
    primes = []
    percentage = 100

    while floor < percentage do
    	i += 2

    	4.times do
            number += i
            total += 1
            primes.push( number ) if is_prime( number )
        end

        percentage = ( primes.length.to_f / total.to_f ) * 100
    end

    return i + 1
end

puts spiral_primes( 10 )