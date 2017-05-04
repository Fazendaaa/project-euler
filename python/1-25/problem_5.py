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

import sys
sys.path.append('../')
# pylint: disable=wrong-import-position,import-error
import project_euler as pe
import math

def smallest_multiple(limit):
    """Return  the  smallest  positive  number that is evenly divisible by given 
    limit"""
    limit_log = math.log10(limit)
    p = pe.erastosthenes_sieve(limit)
    result = 1

    for i in range(0, len(p)):
        result *= pow(p[i], math.floor(limit_log/math.log10(p[i])))

    return result

print(smallest_multiple(20))
