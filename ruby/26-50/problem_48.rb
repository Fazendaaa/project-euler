=begin
								Self powers

	The series, 1¹ + 2² + 3³ + ... + 10**10 = 10405071317.

	Find the last ten digits of the series, 1¹ + 2² + 3³ + ... + 1000**1000.
=end

def self_powers( limit )
	return ( 1..limit ).inject { | sum, e | sum += e**e }
end

puts self_powers( 1_000 ).to_s.split( '' )[ -10..-1 ].join( '' )