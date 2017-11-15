=begin
                            Pandigital multiples

    Take the number 192 and multiply it by each of 1, 2, and 3:

                                192 × 1 = 192
                                192 × 2 = 384
                                192 × 3 = 576

    By  concatenating  each  product we get the 1 to 9 pandigital, 192384576. We
    will call 192384576 the concatenated product of 192 and (1,2,3)

    The  same  can be achieved by starting with 9 and multiplying by 1, 2, 3, 4,
    and  5,  giving the pandigital, 918273645, which is the concatenated product
    of 9 and (1,2,3,4,5).

    What  is  the largest 1 to 9 pandigital 9-digit number that can be formed as
    the concatenated product of an integer with (1,2, ... , n) where n > 1?

    Articles that helped me out understand better the problem:
        *   http://www.mathblog.dk/project-euler-38-pandigital-multiplying-fixed-number/
=end

def pandigital_multiples
    for i in 9_387.downto( 9_234 ) do
        result = i.to_s + ( 2*i ).to_s
        break if '123456789' == result.split( '' ).sort.join( '' )
    end

    return result
end

puts pandigital_multiples
