=begin
                                10001st prime

    By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.
    What is the 10 001st prime number?

    note:
    "An  array with 500 million elements is 2 GiBytes in size, which – depending
    on  the  specific OS you are using – is typically the maximum that a process
    can address. In other words: your array is bigger than your address space."
    from: http://stackoverflow.com/questions/3687517/array-size-too-big-ruby/3688388#3688388
=end

#!/usr/bin/ruby

def sieve( limit )
    max_length = 500_000_000
    primes = []
    numbers = Array.new( max_length ) { | i | true }
    numbers[ 0 ] = false
    numbers[ 1 ] = false

    max = ( Math.sqrt( max_length ) ).to_i
    for i in ( 2..max ) do
        if numbers[ i ] then
            ( i**2..max_length ).step( i ) do | j |
                numbers[ j ] = false
            end
        end
    end

    primes = numbers.each_index.select { | i | true == numbers[ i ]  }
    return primes[ limit-1 ]
end

puts sieve( 10_001 )
