"""
                                Power digit sum

    2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

    What is the sum of the digits of the number 2**1000?

    							Answer: 1366
"""

def power_digit_sum(base, power):
    """Return the sum of the digtis in base**power"""
    return sum([int(x) for x in list(str(base**power))])

print(power_digit_sum(2, 1000))
