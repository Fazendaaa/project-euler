"""
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
"""

def collatz_sequence(seed):
    """Given seed generates Collatz sequence"""
    sequence = [seed]
    counter = seed

    # pylint: disable=misplaced-comparison-constant
    while 1 != counter:
        # pylint: disable=misplaced-comparison-constant
        counter = (int(counter/2) if 0 == counter%2 else 3*counter+1)
        sequence.append(counter)

    return sequence

def longest_collatz_sequence(limit):
    """Given limit, returns it the number that has the longest chain in Collatz
     sequence"""
    maximum = [0, 0]

    for i in range(1, limit+1):
        collatz = len(collatz_sequence(i))
        if collatz > maximum[0]:
            maximum[0] = collatz
            maximum[1] = i

    return maximum[1]

print(longest_collatz_sequence(1000000))
