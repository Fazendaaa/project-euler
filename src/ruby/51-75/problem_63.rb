=begin
							Powerful digit counts
	
	The   5-digit   number,  16807=7**5,  is  also  a  fifth  power.  Similarly, 
	the 9-digit	number, 134217728=8**9, is a ninth power.

	How many n-digit positive integers exist which are also an nth power?

	Helped me out:
		*	http://www.mathblog.dk/project-euler-63-n-digit-nth-power/
		*	http://stackoverflow.com/a/884544/7092954
=end

#!/usr/bin/ruby

def powerful_digit_count
	result = 0
	lower = 0
	n = 1

	while lower < 10 do
		lower = ( 10**( ( n - 1.0 ) / n ) ).ceil
		result += 10 - lower
		n += 1
	end

	return result
end

puts powerful_digit_count