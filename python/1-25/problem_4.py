"""
                            Largest palindrome product

    A  palindromic  number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.

                                Answer: 906609
"""

def three_digits_palindrome():
    """Function that returns all the possibles aplindromes made from the product of two three-digit numbers"""
    palindrome = []

    for x in range(100, 999):
        for y in  range(100, 999):
            if str(x*y)[::-1] == str(x*y):
                palindrome.append(x*y)

    return sorted(palindrome)

print(three_digits_palindrome()[-1])
