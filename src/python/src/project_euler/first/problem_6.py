#                        Sum square difference
#
# The sum of the squares of the first ten natural numbers is,
#
#                    1² + 2² + ... + 10² = 385
#
# The square of the sum of the first ten natural numbers is,
#
#                (1 + 2 + ... + 10)² = 55² = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find  the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.
#
#    						Answer: 25164150
#

from functools import reduce


def sum_square_diff(limit: int) -> int:
    """
    Calculate difference between square of sum and sum of squares for first n natural numbers.

    Args:
        limit (int): Upper limit of natural numbers to consider

    Returns:
        int: Difference between (sum of numbers)^2 and sum of (numbers^2)

    Example:
        >>> sum_square_diff(10)
        2640
    """
    result = 0
    numbers = range(1, limit + 1)

    if 1 < limit:
        sum_1 = reduce(lambda x, y: x + y, numbers)
        sum_2 = reduce(lambda x, y: x + y**2, numbers)
        result = sum_1**2 - sum_2

    return result
