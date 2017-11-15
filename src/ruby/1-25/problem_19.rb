=begin
                                Counting Sundays

    You  are  given  the  following  information,  but you may prefer to do some
    research for yourself.

        *   1 Jan 1900 was a Monday.
        *   Thirty days has September,
            April, June and November.
            All the rest have thirty-one,
            Saving February alone,
            Which has twenty-eight, rain or shine.
            And on leap years, twenty-nine.
        *   A  leap  year occurs on any year evenly divisible by 4, but not on a
            century unless it is divisible by 400.

    How many Sundays fell on the first of the month during the twentieth century
    ( 1 Jan 1901 to 31 Dec 2000 )?

                                Answer: 171
=end

#!/usr/bin/ruby

require 'date'

def counting_sundays( start, finish )
    s_year, s_mon, s_day = start
    f_year, f_mon, f_day = finish
    
    return Date.new( s_year, s_mon, s_day ).
           upto( Date.new( f_year, f_mon, f_day ) ).
           find_all { | d | d.mday == 1 && d.wday == 0 }.count
end

puts counting_sundays( [ 1901, 1, 1 ], [ 2000 , 12, 31] )
