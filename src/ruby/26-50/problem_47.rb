=begin
							Distinct primes factors

	The first two consecutive numbers to have two distinct prime factors are:

								14 = 2 × 7
								15 = 3 × 5

	The  first  three  consecutive  numbers to have three distinct prime factors
	are:

							644 = 2² × 7 × 23
							645 = 3 × 5 × 43
							646 = 2 × 17 × 19.

	Find the first four consecutive integers to have four distinct prime factors
	each. What is the first of these numbers?

	Articles that helped me out:
		*	http://math.stackexchange.com/a/631591
		*	https://en.wikipedia.org/wiki/Pollard's_rho_algorithm
		*	https://rosettacode.org/wiki/Prime_decomposition#Ruby
		*	http://mathworld.wolfram.com/PrimeFactorizationAlgorithms.html
=end

require_relative 'project_euler'

def distinct_primes_factors( limit )
	matches = []
	number = 1

	while matches.length < limit do
		number += 1
		if prime_factors( number ).uniq.length == limit then
			matches.push( number )
			matches = matches[ -1..-1 ] if matches.length > 1 &&
										   matches[ -2 ] + 1 != matches[ -1 ]	
		end
	end

	return matches
end

puts distinct_primes_factors( 4 )[ 0 ]
