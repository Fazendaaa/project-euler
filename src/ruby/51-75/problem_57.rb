=begin
							Square root convergents

	It  is  possible  to show that the square root of two can be expressed as an
	infinite continued fraction.

				√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

	By expanding this for the first four iterations, we get:

				1 + 1/2 = 3/2 = 1.5
				1 + 1/(2 + 1/2) = 7/5 = 1.4
				1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
				1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

	The  next  three  expansions are 99/70, 239/169, and 577/408, but the eighth
	expansion,  1393/985, is the first example where the number of digits in the
	numerator exceeds the number of digits in the denominator.

	In the first one-thousand expansions, how many fractions contain a numerator
	with more digits than denominator?

	Articles that helped me out:
		*	http://www.mathblog.dk/project-euler-57-square-root-two/
=end

def square_root_convergents( limit )
	denominator = 2
	numerator = 3
	matches = []

	limit.times do
		numerator += 2*denominator
		denominator = numerator - denominator
		
		matches.push( [ numerator, denominator ] ) if
		( Math::log10( numerator ) ).to_i > ( Math::log10( denominator ) ).to_i
	end

	return matches
end

puts square_root_convergents( 1_000 ).length