"""
    This is a library inplement as helper to common used functions to solve \
    Project Euler most common directives
"""

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
