#                           Pandigital Products
#
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.
#
# Reference:
#   - https://projecteuler.net/problem=32
#


def isPandigital(number: int) -> bool:
    """
    Checks if a number is pandigital (contains digits 1 to n exactly once,
    where n is the number of digits)

    Args:
        number (int): The number to check

    Returns:
        bool: True if the number is pandigital, False otherwise

    Examples:
        >>> isPandigital(15234)
        True
        >>> isPandigital(12345)
        True
        >>> isPandigital(11234)
        False
    """
    digits = str(number)
    digitsSet = set(str(number))

    if "0" in digitsSet or len(digits) != len(digitsSet):
        return False

    return all(str(index) in digitsSet for index in range(1, len(digits) + 1))


def pandigitalProducts(numberOfDigits: int) -> int:
    pandigitals: set[int] = set()

    for multiplicand in range(1, 5_000):
        for multiplier in range(1, 100):
            product = multiplicand * multiplier
            digits = f"{multiplicand}{multiplier}{product}"

            if len(digits) == numberOfDigits and isPandigital(int(digits)):
                pandigitals.add(product)

    return sum(pandigitals)
