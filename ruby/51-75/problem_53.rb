=begin
						Combinatoric selections

	There are exactly ten ways of selecting three from five, 12345:

			123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

	In combinatorics, we use the notation, 5C3 = 10.

	In general,

					nCr = n!/r!(n−r)!
	
	where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
	
	It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

	How  many,  not  necessarily  distinct, values of  nCr, for 1 ≤ n ≤ 100, are
	greater than one-million?	
=end

def combinatoric_selections( limit )
	selections = []
	factorial = Hash.new( true )

	for n in 1..limit do
		for r in 1..n do
			# => using hashes to avoid recalculate factorials values
			factorial[ n ] = ( 1..n ).reduce( 1, :* ) if factorial[ n ]
			n_fact = factorial[ n ]

			factorial[ r ] = ( 1..r ).reduce( 1, :* ) if factorial[ r ]
			r_fact = factorial[ r ]

			diff_fact = n - r 
			factorial[ diff_fact ] = ( 1..diff_fact ).reduce( 1, :* ) if factorial[ diff_fact ]
			diff_fact = factorial[ diff_fact ]

			selections.push( n_fact/( r_fact*diff_fact ) )
		end
	end

	return selections
end

puts combinatoric_selections( 100 ).select { | e | 1_000_000 < e }.length