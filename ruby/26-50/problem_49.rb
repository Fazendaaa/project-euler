=begin
							Prime permutations

	The  arithmetic  sequence,  1487,  4817,  8147,  in  which each of the terms
	increases by 3330, is unusual in two ways:

		I. Each of the three terms are prime
		II. Each of the 4-digit numbers are permutations of one	another.

	There  are  no  arithmetic  sequences  made  up  of three 1-, 2-, or 3-digit
	primes,  exhibiting this property, but there is one other 4-digit increasing
	sequence.

	What  12-digit  number  do you form by concatenating the three terms in this
	sequence?
=end

require_relative 'project_euler'

def prime_permutations
	limit = 9_999
	# => select  only primes between 1487 and 9999 -- being the last one the max
	# => four-digit number
	primes = sieve( limit )[ 236..-1 ]
	matches = []

	for a in 0..primes.length-1 do
		for b in a+1..primes.length-1 do
			c = primes[ b ] + ( primes[ b ] - primes[ a ] )
						
			if c < limit && is_prime( c ) then
				p1 = primes[ a ].to_s.split( '' ).sort
				p2 = primes[ b ].to_s.split( '' ).sort
				p3 = c.to_s.split( '' ).sort

				if p1 == p2 && p1 == p3 then
					matches.push( [ primes[ a ], primes[ b ], c ] )
					break
				end
			end
		end

		break if 0 != matches.length
	end

	return matches
end

puts prime_permutations.join( "" )