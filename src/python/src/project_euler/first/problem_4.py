"""
                        Largest palindrome product

A  palindromic  number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

                            Answer: 906609
"""


def three_digits_palindrome():
    """Function that returns all the possibles aplindromes made from the product
    of two three-digit numbers"""
    palindrome = []

    for index_i in range(100, 1_000):
        for index_ii in range(100, 1_000):
            if str(index_i * index_ii)[::-1] == str(index_i * index_ii):
                palindrome.append(index_i * index_ii)

    return sorted(palindrome)


print(three_digits_palindrome()[-1])
