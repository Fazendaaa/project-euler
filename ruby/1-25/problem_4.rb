=begin
                            Largest palindrome product

    A  palindromic  number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.

                                Answer: 906609
=end

#!/usr/bin/ruby

def three_digits_palindrome
    palindrome = []

    for x in 100..999 do
        for y in 100..999 do
            palindrome.push( x*y ) if ( x*y ).to_s == ( ( x*y ).to_s ).reverse
        end
    end

    return palindrome
end

puts three_digits_palindrome.sort.pop
