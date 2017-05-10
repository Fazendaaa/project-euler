=begin
							Prime digit replacements

	By  replacing  the 1st digit of the 2-digit number *3, it turns out that six
	of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

	By  replacing  the  3rd  and  4th  digits of 56**3 with the same digit, this
	5-digit  number  is  the  first  example  having  seven primes among the ten
	generated  numbers,  yielding the family: 56003, 56113, 56333, 56443, 56663,
	56773, and 56993. Consequently 56003, being the first member of this family,
	is the smallest prime with this property.

	Find  the smallest  prime  which,  by   replacing  part  of  the number (not
	necessarily  adjacent digits) with the same digit, is part of an eight prime
	value family.

	Articles that helped me out:
		*	http://stackoverflow.com/a/8377194/7092954
		*	https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer
=end

require_relative 'project_euler'

# => will generate all possible masks for positions
def generate_combinations( n )
	# => since  the  first  combination will replace ALL digits and the last one
	# => won't replace anything both won't be necessary
	return [ true, false ].repeated_permutation( n ).to_a[ 1..-2 ]
end

def smallest_prime_digits_replacements( min )
	n = 10
	matches = []
	hash = Hash.new( false )
	masks = []

	while matches.length < min do
		n += 1
		# => problably  a  little  awkward  but  since  hash is much faster then
		# => is_prime  if hash[ combination ] prove to be true is_prime will not
		# => be called and if this verification could be avoided there's need to
		# => call it only the first time that the combination value appers
		if hash[ n ] || is_prime( n ) then
			hash[ n ] = true

			prime = n.to_s.split( '' ).map( &:to_i )
			
			# => all  primes  that have that have same length will have the same
			# => possible combinations
			masks = generate_combinations( prime.length ) if masks.length != prime.length

			for mask in masks do
				matches = []
				new_number = prime.clone
				
				for digit in 0..9 do
					mask.each_with_index do | e, i | new_number[ i ] = digit if e end

					possibility = new_number.join.to_i
					
					if prime.length == possibility.to_s.length then
						if hash[ possibility ] || is_prime( possibility )
							matches.push( possibility )
							hash[ possibility ] = true
						end
					end
				end

				break if matches.length == min
			end
		end
	end

	return matches
end

puts smallest_prime_digits_replacements( 8 )[ 0 ]
