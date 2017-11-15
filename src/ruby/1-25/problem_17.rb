=begin
                            Number letter counts

    If the numbers 1 to 5 are written out in words: one, two, three, four, five,
    then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

    If  all the numbers from 1 to 1000 (one thousand) inclusive were written out
    in words, how many letters would be used?

    NOTE:  Do  not  count spaces or hyphens. For example, 342 (three hundred and
    forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
    letters.  The  use  of  "and" when writing out numbers is in compliance with
    British usage.

                            Answer: 21124

    Articles that helped me out:
        *   http://stackoverflow.com/a/31605263/7092954
        *   https://github.com/taimur-akhtar/to_words
        *   http://stackoverflow.com/a/4308399/7092954
=end

#!/usr/bin/ruby

require 'to_words'

def number_letter_counts( limit )
    return ( 1..limit ).inject( 0 ) { | sum, e | sum += e.to_words.gsub(' ', '').length }
end

puts number_letter_counts( 1_000 )
