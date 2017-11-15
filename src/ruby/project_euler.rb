=begin
                            Common used functions
=end

# ==============================================================================

class Integer
    def is_odd?
        0 != self % 2
    end

    def is_even?
        !self.is_odd?
    end
end


# ==============================================================================

def is_prime( number )
    return false if 2 > number

    for i in 2..Math.sqrt( number ) do
        return false if 0 == number % i
    end

    return true
end

def erastosthenes_sieve( limit )
    # => in case limit is a prime there's need to add one to count limit as prime
    limit = limit + 1
    numbers = Array.new( limit ) { | i | true }
    numbers[ 0 ] = numbers[ 1 ] =  false

    for i in 2..Math.sqrt( limit ).to_i do
        (i**2..limit).step(i) do | j |
            numbers[ j ] = false
        end
    end

    return numbers.each_index.select { | i | numbers[ i ] }
end

def all_divisors( number )
    divisors = []

    if 0 > number then
        return [ 0 ]
    elsif 1 == number then
        return [ 1 ]
    else
        for i in 1..Math.sqrt( number ).to_i do
            if 0 == number % i then
                divisors.push( i )
                divisors.push( number/i ) if number/i != i
            end
        end

        return divisors.sort
    end
end

def prime_factors( n )
    factors = []
    
    check = proc do | p |
        while( q, r = n.divmod( p )
               r.zero? )
            factors.push( p )
            n = q
        end
    end

    check[ 2 ]
    check[ 3 ]
    
    p = 5
    
    while p * p <= n
        check[ p ]
        p += 2
        check[ p ]
        p += 4
    end
    
    factors.push( n ) if n > 1
    
    return factors
end

def in_groups( n, arrray )
  return [] if 0 > n
  
  slice_size = ( arrray.length / Float( n ) ).ceil
  return arrray.each_slice( slice_size ).to_a
end

def is_palindromic( string )
    return string == string.reverse
end

def next_prime( number )
    return 2 if 2 > number

    n = ( 0 != ( number + 1 ) % 2 ) ? number + 1 : number + 2

    while !is_prime( n ) do
        n += 2
    end

    return n
end

# ==============================================================================

def y_triangle( number ) ( ( Math.sqrt( 1 + 8*number ) + 1.0 ) / 2.0 ) end

def y_square( number ) Math.sqrt( number ) end

def y_pentagonal( number ) ( ( Math.sqrt( 1 + 24*number ) + 1.0 ) / 6.0 ) end

def y_hexagonal( number ) ( ( Math.sqrt( 1 + 8*number ) + 1.0 ) / 4.0 ) end

def y_heptagonal( number ) ( ( Math.sqrt( 9 + 40*number ) + 3.0 ) / 10.0 ) end

def y_octagonal( number )( ( Math.sqrt( 4 + 12*number ) + 2.0 ) / 6.0 ) end

# ==============================================================================

def is_triangle( number ) 0 == y_triangle( number ) % 1 end

def is_square( number ) 0 == y_square( number ) % 1 end

def is_pentagonal( number ) 0 == y_pentagonal( number ) % 1 end

def is_hexagonal( number ) 0 == y_hexagonal( number ) % 1 end

def is_heptagonal( number ) 0 == y_heptagonal( number ) % 1 end

def is_octagonal( number ) 0 == y_octagonal( number ) % 1 end

# ==============================================================================

def f_triangle( number ) number*( number + 1 ) / 2 end

def f_square( number ) number**2 end

def f_pentagonal( number ) number*( 3*number - 1 ) / 2 end

def f_hexagonal( number ) number*( 2*number - 1 ) end

def f_heptagonal( number ) number*( 5*number - 3 ) / 2 end

def f_octagonal( number ) number*( 3*number - 2 ) end

# ==============================================================================

def cube_root(x) ( Math.exp( Math.log( x.to_f ) / 3.to_f ) ).round( 12 ) end

def is_cube_root( n ) 0 == cube_root( n ) % 1 end
