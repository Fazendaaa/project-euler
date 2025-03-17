"""
                        Number letter counts

    If the numbers 1 to 5 are written out in words: one, two, three, four, five,
    then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

    If  all the numbers from 1 to 1000 (one thousand) inclusive were written out
    in words, how many letters would be used?

    NOTE:  Do  not  count spaces or hyphens. For example, 342 (three hundred and
    forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
    letters.  The  use  of  "and" when writing out numbers is in compliance with
    British usage.

                            Answer: 21124
"""

import re
from functools import reduce
from operator import add
from num2words import num2words as nw

def modify(number):
    """Removes spaces and hyphens from numbers when converted to letters"""
    return len(re.sub(r'-| ', '', nw(number)))

def number_letter_counds(limit):
    """Converts numbers from one to limit into letters and sum the lenght of it"""
    return reduce(add, [modify(x) for x in range(1, limit+1)])

print(number_letter_counds(1000))
