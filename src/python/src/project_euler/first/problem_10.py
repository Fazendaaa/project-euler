"""
                    Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

                    Answer: 142913828922
"""

from project_euler.project_euler import eratosthenes_sieve


def summationOfPrimes(value: int) -> int:
    """
    Calculates the sum of all prime numbers below a given value.

    Args:
        value (int): Upper limit below which to find prime numbers

    Returns:
        int: Sum of all prime numbers below the given value

    Example:
        >>> summationOfPrimes(10)
        17
        >>> summationOfPrimes(2000000)
        142913828922
    """
    return sum(eratosthenes_sieve(value))
