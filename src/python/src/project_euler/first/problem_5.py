#
#                          Smallest multiple
#
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
#
#                          Answer: 232792560
#
# Helped me out:
#     *   http://www.mathblog.dk/project-euler-problem-5/
#

from math import floor, log10
from typing import Any, Literal

from project_euler.project_euler import eratosthenes_sieve


def smallest_multiple(limit: int) -> Any | Literal[1]:
    limit_log = log10(limit)
    primes = eratosthenes_sieve(limit)
    result = 1

    for i in primes:
        result *= pow(i, floor(limit_log / log10(i)))

    return result
