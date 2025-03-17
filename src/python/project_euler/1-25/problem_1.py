"""
							Multiples of 3 and 5

	If we list all the natural numbers below 10 that are multiples of 3 or 5, we
	get 3, 5, 6 and 9. The sum of these multiples is 23.

	Find the sum of all the multiples of 3 or 5 below 1000.

							Answer: 233168
"""

import functools

def multiples_three_five(limit):
    """Function that given limit filters the array by the number that are multiple of 3 or 5"""
    # pylint: disable=misplaced-comparison-constant
    # mislaced-comparison-constant a.k.a.: 'Yoda conditions'
    return [x for x in range(1, limit) if 0 == x%3 or 0 == x%5]

print(functools.reduce(lambda x, y: x+y, multiples_three_five(1000)))
