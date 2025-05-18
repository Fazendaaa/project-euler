"""
                                Amicable numbers

    Let  d(n) be defined as the sum of proper divisors of n (numbers less than n
    which  divide  evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a
    and b are an amicable pair and each of a and b are called amicable numbers.

    For  example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
    55  and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
    71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under 10000.

                                Answer: 31626

    Helped me out:
        *   https://en.wikipedia.org/wiki/Amicable_numbers
"""

import sys

sys.path.append("../")
# pylint: disable=wrong-import-position,import-error
import python.project_euler.project_euler as pe


def amicable_numbers(limit):
    """Calculates all Amicable numbers under given limit"""
    amicable = []

    #   The first pair of Amicable Numbers are 220 and 284
    # pylint: disable=misplaced-comparison-constant
    if 220 <= limit:
        for i in range(220, limit + 1):
            other = sum(sorted(pe.all_divisors(i))[:-1])
            if i != other and sum(sorted(pe.all_divisors(other))[:-1]) == i:
                amicable.append(i)

    return amicable


print(sum(amicable_numbers(10000)))
