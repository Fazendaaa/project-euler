=begin
							Permuted multiples
	
	It  can  be  seen  that  the number, 125874, and its double, 251748, contain
	exactly the same digits, but in a different order.

	Find  the  smallest  positive  integer, x, such that 2x, 3x, 4x, 5x, and 6x,
	contain the same digits.
=end

def permuted_multiples( limit )
	matches = []
	n = 1

	while matches.length < limit do
		n += 1
		number = n.to_s.split( "" ).sort
		matches = ( 1..limit ).map { | e | e*n }.
							  select { | e | e.to_s.split( "" ).sort == number }
	end

	return matches
end

puts permuted_multiples( 6 )[ 0 ]