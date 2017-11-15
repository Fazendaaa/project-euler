=begin
                                Pandigital prime

    We shall say that an n-digit number is pandigital if it makes use of all the
    digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
    also prime.

    What is the largest n-digit pandigital prime that exists?
=end

def is_prime( number )
    return false if 2 > number
    for i in 2..Math.sqrt( number ) do
        return false if 0 == number % i
    end
    return true
end

def pandigital_prime( n )
    return ( 1..n ).flat_map { | i | ( 1..i ).to_a.permutation.
                    map { | e | e.join( '' ).to_i } }.
                    select { | e | is_prime( e ) }
end

puts pandigital_prime( 9 ).max
