"""
                        Factorial digit sum

    n! means n × (n − 1) × ... × 3 × 2 × 1

    For  example,  10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,  and the sum of the
    digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

    Find the sum of the digits in the number 100!

                            Answer: 648
"""

from operator import mul
from functools import reduce

def factorial_digit_sum(limit):
    """Given number, calculates it factorial and returns it the sum of digits in it"""
    return sum(list(map(int, str(reduce(mul, range(1, limit+1))))))

print(factorial_digit_sum(100))
