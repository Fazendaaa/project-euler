"""
                        Sum square difference

    The sum of the squares of the first ten natural numbers is,

                    1² + 2² + ... + 10² = 385

    The square of the sum of the first ten natural numbers is,

                (1 + 2 + ... + 10)² = 55² = 3025

    Hence the difference between the sum of the squares of the first ten natural
    numbers and the square of the sum is 3025 − 385 = 2640.

    Find  the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum.

    						Answer: 25164150
"""

import functools as ft

def sum_square_diff(limit):
    """Returns the difference between the sum of the squares of the given limit\
     natural numbers and the square of the sum"""
    result = 0
    numbers = [x for x in range(1, limit+1)]

    # pylint: disable=misplaced-comparison-constant
    if 1 < limit:
        sum_1 = (ft.reduce(lambda x, y: x+y, numbers))
        sum_2 = (ft.reduce(lambda x, y: x+y**2, numbers))
        result = sum_1**2 - sum_2

    return result

print(sum_square_diff(100))
