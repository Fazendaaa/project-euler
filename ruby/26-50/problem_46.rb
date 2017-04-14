=begin
						Goldbach's other conjecture
	
	It was proposed by Christian Goldbach that every odd composite number can be
	written as the sum of a prime and twice a square.

							9 = 7 + 2×1²
							15 = 7 + 2×2²
							21 = 3 + 2×3²
							25 = 7 + 2×3²
							27 = 19 + 2×2²
							33 = 31 + 2×1²

	It turns out that the conjecture was false.

	What  is  the  smallest odd composite that cannot be written as the sum of a
	prime and twice a square?
=end

require_relative 'project_euler'

def is_twice_sqrt( number )
	return Math.sqrt( number / 2 ) % 1 == 0
end

def goldbach_other_conjecture
	odd = 1
	flag = true

	while flag do
		odd += 2
		break if !sieve( odd ).any? { | p | is_twice_sqrt( odd - p ) } 
	end

	return odd
end

puts goldbach_other_conjecture