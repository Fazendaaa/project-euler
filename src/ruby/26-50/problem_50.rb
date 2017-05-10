=begin
						Consecutive prime sum

	The prime 41, can be written as the sum of six consecutive primes:

					41 = 2 + 3 + 5 + 7 + 11 + 13
	
	This  is  the   longest sum of consecutive primes that adds to a prime below
	one-hundred.

	The  longest  sum  of  consecutive  primes below one-thousand that adds to a
	prime, contains 21 terms, and is equal to 953.

	Which  prime,  below  one-million,  can  be  written  as the sum of the most
	consecutive primes?
=end

require_relative 'project_euler'

def consecutive_prime( limit )
	primes = sieve( limit )
	matches = []
	tmp = []
	hash = Hash.new( false )

	primes.each do | prime | hash[ prime ] = true end

	for a in 0..primes.length-1 do
		for b in a+1..primes.length-1 do
			tmp = primes[ a..b ]
			sum = tmp.reduce( :+ )

			# => I   could   use  is_prime  function,  but  when  the  input  is 
			# => one-million Hash proved to be four times quick
			if hash[ sum ] && sum < limit && tmp.length > matches.length
				matches = tmp
			else
				tmp = []
			end

			break if sum > limit
		end
		tmp = []
	end

	return matches	
end

puts consecutive_prime( 1_000_000 ).reduce( :+ )
