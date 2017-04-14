=begin
								Prime pair sets

	The  primes  3,  7,  109,  and  673, are quite remarkable. By taking any two
	primes  and concatenating them in any order the result will always be prime.
	For  example,  taking  7  and  109, both 7109 and 1097 are prime. The sum of
	these  four  primes, 792, represents the lowest sum for a set of four primes
	with this property.

	Find  the  lowest  sum  for  a  set  of five primes for which any two primes
	concatenate to produce another prime.

=end

#!/usr/bin/ruby

require_relative '../project_euler'

def prime_pair_sets( min )
	primes = []
	n = 0
	
	set = catch( :END ) {
		#while n = next_prime( n ) do
		while n < 674 do	
			n = next_prime( n )
			puts n
			primes.push( n )
			tmp = [ n ]
			flag = true

			for prime in primes do
				pre = ( prime.to_s.concat( n.to_s ) ).to_i
				pos = ( n.to_s.concat( prime.to_s ) ).to_i

				tmp.push( prime ) if is_prime( pre ) && is_prime( pos )
			end

			for number in tmp.permutation( 2 ) do
				new_number = number.join.to_i
				
				if is_prime( new_number ) then
					
				end
			end

			if flag then
				if 673 == n then
					print tmp, "\n"
				end

				tmp.flatten!
				tmp.uniq! if nil != tmp

				throw :END, tmp if tmp.length == min
			end
		end
	}

	return set
end

print prime_pair_sets( 4 ), "\n"#.reduce( :+ )

