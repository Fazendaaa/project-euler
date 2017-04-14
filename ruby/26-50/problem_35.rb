=begin
                                Circular primes

    The  number,  197,  is  called a circular prime because all rotations of the
    digits: 197, 971, and 719, are themselves prime.

    There  are  thirteen  such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
    71, 73, 79, and 97.

    How many circular primes are there below one million?
=end

def sieve( limit )
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = numbers[ 1 ] =  false

    for i in 2..Math.sqrt( limit ).to_i do
        (i**2..limit).step(i) do | j | numbers[ j ] = false end if numbers[ i ]
    end

    return numbers.each_index.select { | i | numbers[ i ] }
end

def circular_primes( limit )
    hash = Hash.new( false )
    primes = sieve( limit )
    circular_primes = primes[ 0..3 ]

    primes.each do | prime |
        hash[ prime ] = true
    end

    for prime in primes do
        tmp = []
        prime = prime.to_s
        for i in 1...prime.length do
            new_number = prime.split( '' ).rotate( i ).join( '' ).to_i
            tmp.push( new_number ) if hash[ new_number ]
        end
        # => in case of all rotations, aside the prime itself, are primes
        circular_primes.push( tmp ) if prime.length-1 == tmp.length
    end

    return circular_primes.flatten.sort.uniq
end

puts circular_primes( 1_000_000 ).length
