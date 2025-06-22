"""
    This is a library implement as helper to common used functions to solve
    Project Euler most common directives
"""

import math


def prime_factors(n):
    """This function returns all the prime numbers up to 'n'"""
    i = 2
    factors = []

    while i * i <= n:
        if n % i:
            i += 1
        else:
            n //= i
            factors.append(i)

    if n > 1:
        factors.append(n)

    return factors


def erastosthenes_sieve(limit: int) -> list[int]:
    """This function returns all the possible prime numbers of a given limit"""
    new_limit = limit + 1
    numbers = [True for _ in range(0, new_limit)]
    numbers[0] = numbers[1] = False

    for i in range(2, int(math.sqrt(new_limit)) + 1):
        for j in range(pow(i, 2), new_limit, i):
            if numbers[i]:
                numbers[j] = False

    return [x for x, y in enumerate(numbers) if y]


def is_prime(number: int) -> bool:
    """This function returns True if a number is prime, False otherwise"""

    return number in erastosthenes_sieve(number)


def all_divisors(n):
    divisors = []

    if 0 > n:
        divisors.append(0)
    elif 1 == n:
        divisors.append(1)
    else:
        for i in range(1, int(math.sqrt(n)) + 1):
            if 0 == n % i:
                divisors.append(i)
                if int(n / i) != i:
                    divisors.append(int(n / i))

    return divisors


def each_cons(array, limit):
    """Given array, returns it all sets of each cons elements"""
    return [array[i : i + limit] for i in range(len(array) - limit + 1)]
