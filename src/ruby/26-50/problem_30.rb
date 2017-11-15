=begin
                                Digit fifth powers

    Surprisingly  there are only three numbers that can be written as the sum of
    fourth powers of their digits:

                            1634 = 1**4 + 6**4 + 3**4 + 4**4
                            8208 = 8**4 + 2**4 + 0**4 + 8**4
                            9474 = 9**4 + 4**4 + 7**4 + 4**4

    As 1 = 1**4 is not a sum it is not included.

    The sum of these numbers is 1634 + 8208 + 9474 = 19316.

    Find  the  sum  of  all  the numbers that can be written as the sum of fifth
    powers of their digits.

    obs: since the problem for me is the upper bound I looked for help:
        *   http://www.mathblog.dk/project-euler-30-sum-numbers-that-can-be-written-as-the-sum-fifth-powers-digits/
=end

def digit_powers( power )
    upper_bound = 9**power
    upper_bound = upper_bound.to_s.length
    upper_bound = upper_bound*9**power
    upper_bound = upper_bound.to_s.length
    upper_bound = upper_bound*9**power
    matches = []

    for number in 2..upper_bound do
        digits = number.to_s.split( // ).map( &:to_i )
        sum = 0

        for digit in digits do
            sum += digit**power
        end

        matches.push( number ) if number == sum
    end

    return matches
end

puts digit_powers( 5 ).inject { | result, element | result += element }
