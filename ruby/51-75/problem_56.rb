=begin
							Powerful digit sum

	A  googol  (10**100) is a massive number: one followed by one-hundred zeros;
	100**100  is  almost  unimaginably large: one followed by two-hundred zeros.
	Despite their size, the sum of the digits in each number is only 1.

	Considering natural numbers of the form, a**b, where a, b < 100, what is the
	maximum digital sum?
=end

def powerful_digit_sum( limit )
	return ( 1..limit-1 ).map { | b |
		   ( 1..limit-1 ).map { | a |
		   ( a**b ).to_s.split( '' ).map( &:to_i ).reduce( :+ ) }.max }.max
end

puts powerful_digit_sum( 100 )