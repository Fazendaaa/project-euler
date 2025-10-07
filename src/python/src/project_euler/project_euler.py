"""
This is a library implement as helper to common used functions to solve
Project Euler most common directives
"""

from math import sqrt


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

    for outerIndex in range(
        2,
        int(sqrt(new_limit)) + 1,
    ):
        for innerIndex in range(
            pow(outerIndex, 2),
            new_limit,
            outerIndex,
        ):
            if numbers[outerIndex]:
                numbers[innerIndex] = False

    return {index for index, item in enumerate(numbers) if item}


def is_prime(number: int) -> bool:
    """
    Determines if a given number is prime by checking if it exists in the set of prime numbers
    up to that number using the Sieve of Eratosthenes algorithm.

    Args:
        number (int): The number to check for primality

    Returns:
        bool: True if the number is prime, False otherwise

    Example:
        >>> is_prime(7)
        True
        >>> is_prime(8)
        False
    """
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
