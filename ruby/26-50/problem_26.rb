=begin
                                Reciprocal cycles

    A  unit  fraction contains 1 in the numerator. The decimal representation of
    the unit fractions with denominators 2 to 10 are given:

        1/2	    = 	0.5
        1/3	    = 	0.(3)
        1/4	    = 	0.25
        1/5	    = 	0.2
        1/6	    = 	0.1(6)
        1/7	    = 	0.(142857)
        1/8	    = 	0.125
        1/9	    = 	0.(1)
        1/10	= 	0.1

    Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
    seen that 1/7 has a 6-digit recurring cycle.

    Find the value of d < 1000 for which 1/d contains the longest recurring
    cycle in its decimal fraction part.

                                Answer: 983

    obs: article that helped me out:
        *   http://www.mathblog.dk/project-euler-26-find-the-value-of-d-1000-for-which-1d-contains-the-longest-recurring-cycle/
        *   http://stackoverflow.com/a/8927009/7092954
        *   https://zach.se/project-euler-solutions/26/
=end

#!/usr/bin/ruby

def reciprocal_cycles( limit )
    max_length = 0
    d = 0

    for number in ( limit-1 ).downto( 2 ) do
        lenght = ( 1..number ).detect( lambda{ 0 } ) { | t | ( 10**t % number ) == 1 }
        max_length, d = lenght, number if lenght > max_length
    end

    return d
end

puts reciprocal_cycles( 1_000 )
