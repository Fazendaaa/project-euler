"""
                            Smallest multiple

    2520  is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.

    What  is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?

                            Answer: 232792560

    Helped me out:
        *   http://www.mathblog.dk/project-euler-problem-5/
"""

import math
import sys

sys.path.append("../")
# pylint: disable=wrong-import-position,import-error
import python.project_euler.project_euler as pe


def smallest_multiple(limit):
    """Return  the  smallest  positive  number that is evenly divisible by given
    limit"""
    limit_log = math.log10(limit)
    primes = pe.erastosthenes_sieve(limit)
    result = 1

    for i in primes:
        result *= pow(i, math.floor(limit_log / math.log10(i)))

    return result


print(smallest_multiple(20))
