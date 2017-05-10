"""
    This is a library inplement as helper to common used functions to solve \
    Project Euler most common directives

    need to use:
        import sys
        sys.path.append('../')
        # pylint: disable=wrong-import-position,import-error
        import project_euler as pe
"""

import math

def prime_factors(n):
    """This function returns all the prime numbers up to 'n'"""
    i = 2
    factors = []

    while i*i <= n:
        if n%i:
            i += 1
        else:
            n //= i
            factors.append(i)

    if n > 1:
        factors.append(n)

    return factors

def erastosthenes_sieve(limit):
    """This function returns all the possible prime numbers of a given limit"""
    numbers = [True for _ in range(0, limit)]
    numbers[0] = numbers[1] = False

    for i in range(2,int(math.sqrt(limit))+1):
        for j in range(pow(i, 2), limit, i):
            if numbers[i]:
                numbers[j] = False
    
    return [x for x, y in enumerate(numbers) if y]

def all_divisors(n):
    divisors = []

    if 0 > n:
        divisors.append(0)
    elif 1 == n:
        divisors.append(1)
    else:
        for i in range(1, int(math.sqrt(n))+1):
            if 0 == n%i:
                divisors.append(i)
                if int(n/i) != i:
                    divisors.append(int(n/i))
        
    return divisors
                    
