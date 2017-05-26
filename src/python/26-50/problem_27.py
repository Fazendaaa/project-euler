"""
                            Quadratic primes

    Euler discovered the remarkable quadratic formula:

                                n² + n + 41

    It  turns  out  that  the formula will produce 40 primes for the consecutive
    integer   values   0≤n≤39.   However,  when n=40,  40²+40+41=40(40+1)+41  is
    divisible  by 41, and certainly when n=41, 41²+41+41 is clearly divisible by
    41.

    The  incredible formula n²−79n+1601 was discovered, which produces 80 primes
    for  the consecutive values 0≤n≤79. The product of the coefficients, −79 and
    1601, is −126479.

    Considering quadratics of the form:

            n²+an+b, where |a|<1000 and |b|≤1000

            where |n| is the modulus/absolute value of n
            e.g. |11|=11 and |−4|=4

    Find   the  product  of  the  coefficients,  a  and  b,  for  the  quadratic
    expression that produces the maximum number of primes for consecutive values
    of n, starting with n=0.

                                Answer: -59231
"""

from functools import reduce
from operator import mul
import sys
sys.path.append('../')
# pylint: disable=wrong-import-position,import-error
from project_euler import all_divisors

# pylint: disable=invalid-name
def quadratic_primes(a, b):
    """Finds it the solution for the quadratic expression: n²+an+b. Where |a|<1000 and |b|≤1000"""
    mod_a = abs(a)
    mod_b = abs(b)
    max_coef = max_a = max_b = 0

    for i in range(-mod_a, mod_a):
        for j in range(-mod_b, mod_b):
            n = 0
            # pylint: disable=misplaced-comparison-constant
            while 2 == len(all_divisors(n**2 + i*n + j)):
                n += 1
            if n > max_coef:
                max_coef, max_a, max_b = n, i, j

    return max_a, max_b

print(reduce(mul, quadratic_primes(1000, 1000)))
