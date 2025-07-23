# 							Multiples of 3 and 5
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# 								Answer: 233168
#


from typing import Callable, Iterator


def multiples(
    limit: int,
    condition: Callable[[int], bool],
) -> Iterator[int]:
    """
    Generate numbers below limit that satisfy the given condition.

    Args:
        limit: Upper bound (exclusive) for numbers to check
        condition: Function that takes an integer and returns boolean

    Returns:
        Iterator yielding numbers that satisfy the condition
    """
    for item in range(1, limit):
        if condition(item):
            yield item


def sumMultiples(
    limit: int,
) -> int:
    """
    Calculate sum of numbers below limit that are multiples of 3 or 5.

    Args:
        limit: Upper bound (exclusive) for numbers to check

    Returns:
        Sum of all multiples of 3 or 5 below limit
    """
    return sum(
        multiples(limit, lambda item: 0 == item % 3 or 0 == item % 5),
    )
