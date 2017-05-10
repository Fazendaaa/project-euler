"""
                        Summation of primes

    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

    Find the sum of all the primes below two million.

                        Answer: 142913828922
"""

import functools as ft
import sys
sys.path.append('../')
# pylint: disable=wrong-import-position,import-error
import project_euler as pe

print(ft.reduce(lambda x, y: x+y, pe.erastosthenes_sieve(2000000)))
