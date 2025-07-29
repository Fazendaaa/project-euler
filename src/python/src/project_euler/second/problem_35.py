#                             Circular Primes
#
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.
#
# How many circular primes are there below one million?
#
# References:
#   - https://projecteuler.net/problem=35
#


from project_euler.project_euler import eratosthenes_sieve, is_prime


def rotate[T](variables: list[T], position: int) -> list[T]:
    """https://stackoverflow.com/a/9457864/7092954

    Returns:
        _type_: _description_
    """
    return variables[position:] + variables[:position]


def rotations(number: int) -> list[int]:
    """Returns all the rotations of a number

    Args:
        number (int): Number to rotate

    Returns:
        list[int]: List of rotations
    """
    digits = list(str(number))

    return [
        int("".join(current))
        for current in [rotate(digits, index) for index, _ in enumerate(digits)]
    ]


def is_circular_prime(number: int) -> bool:
    """Checks if a number is a circular prime

    Args:
        number (int): Number to check

    Returns:
        bool: True if the number is a circular prime, False otherwise
    """
    return all([is_prime(current) for current in rotations(number)])


def circular_primes(limit: int) -> int:
    """Returns the number of circular primes below a given limit

    Args:
        limit (int): Limit to check

    Returns:
        int: Number of circular primes below the limit
    """
    primes = eratosthenes_sieve(limit)

    def is_rotations_in_primes(number: int) -> bool:
        """Checks if all number rotations is in the list of primes

        Args:
            number (int): Number to check

        Returns:
            bool: Whether or not all the number rotations are in the list of primes
        """

        return all([current in primes for current in rotations(number)])

    return len([number for number in primes if is_rotations_in_primes(number)])
