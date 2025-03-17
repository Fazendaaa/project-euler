"""
                                10001st prime

    By  listing  the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
    that the 6th prime is 13.

    What is the 10 001st prime number?

                                Answer: 104743
"""

import math

def sieve(pos):
    """Given pos this function returns the determinated prime"""
    #   limit was a totally abritary number that I assigned
    limit = 5000000
    numbers = [True for _ in range(1, limit)]
    numbers[0] = numbers[1] = False

    for index_i in range(2, int(math.sqrt(limit))):
        if numbers[index_i]:
            for index_ii in range(index_i**2, limit, index_i):
                numbers[index_ii] = False

    return [x for x, y in enumerate(numbers) if y][pos-1]

print(sieve(10001))
