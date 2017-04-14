=begin
                            Longest Collatz sequence

    The  following  iterative  sequence  is  defined  for  the  set  of positive
    integers:

                            n → n/2 (n is even)
                            n → 3n + 1 (n is odd)

    Using  the  rule  above  and  starting  with  13,  we generate the following
    sequence:

                13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

    It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
    contains 10 terms. Although it has not been proved yet (Collatz Problem), it
    is thought that all starting numbers finish at 1.
    
    Which starting number, under one million, produces the longest chain?
    
    NOTE: Once the chain starts the terms are allowed to go above one million.

                                Answer: 837799
                
    Helped me out:
        *   http://stackoverflow.com/a/41623431/7092954
=end

def collatz_sequence( seed )
    sequence = [ seed ]
    n = seed

    while 1 != n
        n = ( 0 == n % 2 ) ? n/2 : 3*n + 1
        sequence.push( n )
    end

    return sequence
end

# => plus one because the array start indexing at zero
puts ( 1..1_000_000 ).map { | i |
     collatz_sequence( i ).length }.each_with_index.max.last + 1
