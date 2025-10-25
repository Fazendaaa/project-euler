"""
This is a library implement as helper to common used functions to solve
Project Euler most common directives
"""

from concurrent.futures import ThreadPoolExecutor, as_completed
from math import sqrt
from typing import Any, Callable, Iterable, Optional


def prime_factors(limit: int) -> list[int]:
    """
    Returns a list of prime factors for a given number.

    Args:
        limit (int): The number to find prime factors for

    Returns:
        list[int]: list containing all prime factors of the input number

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
    numbers = [i % 2 != 0 for i in range(new_limit)]
    numbers[2] = True

    for outerIndex in range(
        1,
        int(sqrt(new_limit)) + 1,
        2,
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


def all_divisors(limit: int) -> list[int]:
    divisors: list[int] = []

    if 0 > limit:
        divisors.append(0)
    elif 1 == limit:
        divisors.append(1)
    else:
        for i in range(1, int(sqrt(limit)) + 1):
            if 0 == limit % i:
                divisors.append(i)
                if int(limit / i) != i:
                    divisors.append(int(limit / i))

    return divisors


def each_cons(array, limit):
    """Given array, returns it all sets of each cons elements"""
    return [array[i : i + limit] for i in range(len(array) - limit + 1)]


def toNumber(value: str) -> int | float:
    """
    Converts a string value to either an integer or float number.

    Args:
        value (str): The string value to convert to a number

    Returns:
        int | float: The converted number as either an integer or float

    Raises:
        ValueError: If the string cannot be converted to a valid number

    Example:
        >>> toNumber("123")
        123
        >>> toNumber("12.34")
        12.34
        >>> toNumber("abc")
        ValueError: 'abc' is not a valid number.
    """
    try:
        return int(value)
    except ValueError:
        try:
            return float(value)
        except ValueError:
            raise ValueError(f"'{value}' is not a valid number.") from None


def __parallelMax(key) -> Callable[..., Any]:
    return lambda item: max(item, key=key)


def parallelMax(
    iterable: Iterable[Any],
    key: Optional[Callable[[Any], Any]] = None,
) -> Any:
    """
    Returns the maximum value from an iterable using parallel processing.

    Args:
        iterable (Iterable[Any]): The input iterable to find maximum value from
        key (Optional[Callable[[Any], Any]], optional): A function to extract comparison key.
            Defaults to None.

    Returns:
        Any: The maximum value from the iterable

    Example:
        >>> parallelMax([1, 5, 2, 8, 3])
        8
        >>> parallelMax(['cat', 'dog', 'elephant'], key=len)
        'elephant'
    """
    with ThreadPoolExecutor() as executor:
        maxFunction = __parallelMax(key)
        futures = [executor.submit(maxFunction, item) for item in iterable]

        return max(
            [f.result() for f in as_completed(futures)],
            key=key,
        )
