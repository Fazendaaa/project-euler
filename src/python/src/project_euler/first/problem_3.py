#
#                            Largest prime factor
#
#    The prime factors of 13195 are 5, 7, 13 and 29.
#
#    What is the largest prime factor of the number 600851475143 ?
#
#                            Answer: 6857
#

from project_euler.project_euler import prime_factors


def largest_prime(limit: int) -> int:
    """
    Returns the largest prime factor of a given number.

    Args:
        limit (int): The number to find the largest prime factor of

    Returns:
        int: The largest prime factor of the input number

    Example:
        >>> largest_prime(13_195)
        29
    """
    return prime_factors(limit)[-1]
