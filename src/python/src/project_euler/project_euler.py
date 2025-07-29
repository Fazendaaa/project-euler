"""
This is a library implement as helper to common used functions to solve
Project Euler most common directives
"""

import math


def prime_factors(limit: int) -> list[int]:
    """
    Returns a list of prime factors for a given number.

    Args:
        limit (int): The number to find prime factors for

    Returns:
        list[int]: List containing all prime factors of the input number

    Example:
        >>> prime_factors(84)
        [2, 2, 3, 7]
    """
    item = 2
    factors: list[int] = []

    while item * item <= limit:
        if limit % item:
            item += 1
        else:
            limit //= item
            factors.append(item)

    if limit > 1:
        factors.append(limit)

    return factors


def eratosthenes_sieve(limit: int) -> set[int]:
    """
    Returns a set of prime numbers up to the given limit using the Sieve of Eratosthenes algorithm.

    Args:
        limit (int): The upper bound for finding prime numbers

    Returns:
        set[int]: Set containing all prime numbers up to the limit

    Example:
        >>> eratosthenes_sieve(10)
        {2, 3, 5, 7}
    """
    new_limit = limit + 1
    numbers = [True for _ in range(0, new_limit)]
    numbers[0] = numbers[1] = False

    for i in range(2, int(math.sqrt(new_limit)) + 1):
        for j in range(pow(i, 2), new_limit, i):
            if numbers[i]:
                numbers[j] = False

    return {x for x, y in enumerate(numbers) if y}


def is_prime(number: int) -> bool:
    """This function returns True if a number is prime, False otherwise"""

    return number in eratosthenes_sieve(number)


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
