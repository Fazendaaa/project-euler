"""
                                Non-abundant sums

    A  perfect  number  is  a number for which the sum of its proper divisors is
    exactly  equal to the number. For example, the sum of the proper divisors of
    28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

    A  number  n  is  called deficient if the sum of its proper divisors is less
    than n and it is called abundant if this sum exceeds n.

    As  12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
    number  that  can  be  written  as the sum of two abundant numbers is 24. By
    mathematical  analysis, it can be shown that all integers greater than 28123
    can be written as the sum of two abundant numbers. However, this upper limit
    cannot  be  reduced any further by analysis even though it is known that the
    greatest  number that cannot be expressed as the sum of two abundant numbers
    is less than this limit.

    Find the sum of all the positive integers which cannot be written as the sum
    of two abundant numbers.

                                Answer: 4179871
"""

import sys

sys.path.append("../")
# pylint: disable=wrong-import-position,import-error
import python.project_euler.project_euler as pe


def non_abundant_number(limit):
    """Calculates all non abundant numbers"""
    abundant = []
    result = []

    for i in range(1, limit + 1):
        if i < sum(sorted(pe.all_divisors(i))[:-1]):
            abundant.append(i)

    for i in abundant:
        for j in abundant:
            add = i + j
            if add > limit:
                break
            result.append(add)

    #   benchmark with set:
    #       python problem_23.py  21.35s user 1.75s system 98% cpu 23.359 total
    #
    #   without set:
    #       python problem_23.py  1434.43s user 4.71s system 99% cpu 24:04.28 total
    result = set(result)
    return [x for x in range(1, limit + 1) if x not in result]


print(sum(non_abundant_number(28123)))
