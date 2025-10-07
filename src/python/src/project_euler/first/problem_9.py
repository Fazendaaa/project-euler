"""
                    Special Pythagorean triplet

A  Pythagorean  triplet  is  a  set of three natural numbers, a < b < c, for
which,
                            a² + b² = c²

For example, 3² + 4² = 9 + 16 = 25 = 5².

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

                    Answer = 31875000
"""

import functools as ft


def special_pythagorean_triplet(limit: int):
    """Finds it the first Pythagorean triplet for which a + b + c = n."""
    triplet: list[int] = []

    for index_i in range(1, limit):
        for index_ii in range(1, index_i):
            for index_iii in range(1, index_ii):
                if (index_iii * index_ii) + (index_i * limit) == (
                    limit**2
                ) / 2 and index_i + index_ii + index_iii == limit:
                    triplet.append(index_i)
                    triplet.append(index_ii)
                    triplet.append(index_iii)

    return triplet


print(int(ft.reduce(lambda x, y: x * y, special_pythagorean_triplet(1000))))
