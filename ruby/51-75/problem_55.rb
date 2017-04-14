=begin
							Lychrel numbers

	If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

	Not all numbers produce palindromes so quickly. For example,

							349 + 943 = 1292,
							1292 + 2921 = 4213
							4213 + 3124 = 7337

	That is, 349 took three iterations to arrive at a palindrome.

	Although  no  one  has  proved it yet, it is thought that some numbers, like
	196,  never  produce  a  palindrome.  A number that never forms a palindrome
	through  the  reverse and add process is called a Lychrel number. Due to the
	theoretical nature of these numbers, and for the purpose of this problem, we
	shall  assume  that  a number is Lychrel until proven otherwise. In addition
	you are given that for every number below ten-thousand, it will either:

		I. Become a palindrome in less than fifty iterations
		II. No one, with all the computing power that exists, has managed so far
			to map it to a palindrome. 

	In  fact, 10677  is  the  first  number  to  be  shown to require over fifty
	iterations   before  producing  a  palindrome:  4668731596684224866951378664
	(53 iterations, 28-digits).

	Surprisingly,  there  are  palindromic  numbers  that are themselves Lychrel
	numbers; the first example is 4994.

	How many Lychrel numbers are there below ten-thousand?

	NOTE:  Wording  was  modified  slightly  on 24  April  2007 to emphasise the
	theoretical nature of Lychrel numbers.	
=end

require_relative '../project_euler'

def lychrel_numbers( limit, iterations=50 )
	matches = []

	for number in 1..limit do
		lychrel = true
		new_number = number

		iterations.times do
			reverse = new_number.to_s.reverse.to_i
			new_number += reverse

		 	if is_palindromic( new_number.to_s ) then
		 		lychrel = false
		 		break
		 	end
		end

		matches.push( number ) if lychrel
	end

	return matches
end

puts lychrel_numbers( 10_000 ).length