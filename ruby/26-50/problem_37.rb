=begin
                            Truncatable primes

    The  number  3797  has  an  interesting  property. Being prime itself, it is
    possible  to continuously remove digits from left to right, and remain prime
    at  each  stage:  3797,  797, 97, and 7. Similarly we can work from right to
    left: 3797, 379, 37, and 3.

    Find  the  sum of the only eleven primes that are both truncatable from left
    to right and right to left.

    NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
=end

def sieve( limit )
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = numbers[ 1 ] =  false

    for i in 2..Math.sqrt( limit ).to_i do
        (i**2..limit).step(i) do | j | numbers[ j ] = false end if numbers[ i ]
    end

    return numbers.each_index.select { | i | numbers[ i ] }
end

def truncatable_primes( limit )
    # => need to know an upper bound more accurate
    primes = sieve( 1_000_000 )
    hash = Hash.new( false )
    truncatable = []

    primes.each do | prime | hash[ prime ] = true end
    # => removing 2, 3, 5 and 7
    primes = primes[ 4..-1 ]

    for prime in primes do
        break if truncatable.length == limit
        new_number = prime.to_s
        truncatable.push( prime ) if ( 0...new_number.length ).all? { | i |
                                        hash[ new_number[ 0..i ].to_i ] &&
                                        hash[ new_number[ i..-1 ].to_i ] }
    end

    return truncatable
end

puts truncatable_primes( 11 ).reduce( :+ )
