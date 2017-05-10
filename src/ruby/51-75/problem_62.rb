=begin
								Cubic permutations

	The  cube,  41063625  (345³),  can  be  permuted to produce two other cubes:
	56623104  (384³) and 66430125 (405³). In fact, 41063625 is the smallest cube
	which has exactly three permutations of its digits which are also cube.

	Find the smallest cube for which exactly five permutations of its digits are
	cube.

							Answer: 127035954683
	
	Helped me out:
		*	https://www.ruby-forum.com/topic/191287
		*	http://stackoverflow.com/a/4410192/7092954
=end

#!/usr/bin/ruby

def cubic_permutations( limit )
	hash = Hash.new { | h, k | h[ k ] = Array.new }

	smallest = catch( :END ) {
		n = 0
		while n += 1 do
			hash[ cubic = ( n**3 ).to_s.split( '' ).sort.join  ].push( n**3 )
			throw :END, hash[ cubic ] if hash[ cubic ].length == limit
		end
	}

	return smallest
end

puts cubic_permutations( 5 )
