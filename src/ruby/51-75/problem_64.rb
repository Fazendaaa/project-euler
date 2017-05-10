=begin
								Odd period square roots

	All square roots are periodic when written as continued fractions and can be
	written in the form:

	[ Couldn't paste here, description in: https://projecteuler.net/problem=64 ]

	It  can  be seen that the sequence is repeating. For conciseness, we use the
	notation  √23 =  [4;(1,3,1,8)], to indicate that the block (1,3,1,8) repeats
	indefinitely.

	The first ten continued fraction representations of (irrational) square
	roots are:

					√2=[1;(2)], period=1
					√3=[1;(1,2)], period=2
					√5=[2;(4)], period=1
					√6=[2;(2,4)], period=2
					√7=[2;(1,1,1,4)], period=4
					√8=[2;(1,4)], period=2
					√10=[3;(6)], period=1
					√11=[3;(3,6)], period=2
					√12= [3;(2,6)], period=2
					√13=[3;(1,1,1,1,6)], period=5

	Exactly four continued fractions, for N ≤ 13, have an odd period.

	How many continued fractions for N ≤ 10000 have an odd period?

	Helped me out:
		*	https://youtu.be/R5HhNmFPLPQ
		*	https://youtu.be/CaasbfdJdJg
		*	http://stackoverflow.com/a/18163626/7092954
=end

require_relative '../project_euler'

def has_period( interval )
	half = interval.length / 2
	a, b = interval.each_slice( half ).to_a

	for i in 0..half-1 do
		return false if a[ i ] != b[ i ]
	end

	return true
end

def continued_fractions( number )
	remain = Math.sqrt( number )
	fractions = [ remain.to_i ]
	period = []

	catch( :END ) {
		while true do
			new_number = remain % 1
			remain = 1.0 / new_number
			period.push( remain.to_i )

			throw :END if has_period( period )
		end
	}

	return fractions.concat( period.slice!( 0..period.length-1 ) )
end

def odd_period_square_roots( limit )
	sqrt_roots = Array.new( limit -1 )

	for i in 2..limit do
		sqrt_roots.push( continued_fractions( i ) )
	end

	return sqrt_roots.select { | e | ( e.length-1 ).is_odd? }
end

puts odd_period_square_roots( 13 ).length