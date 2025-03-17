"""
                            Distinct powers

    Consider all integer combinations of ab for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:

                        2²=4, 2³=8, 2**4=16, 2**5=32
                        3²=9, 3³=27, 3**4=81, 3**5=243
                        4²=16, 4³=64, 4**4=256, 4**5=1024
                        5²=25, 5³=125, 5**4=625, 5**5=3125

    If they are then placed in numerical order, with any repeats removed, we get
    the following sequence of 15 distinct terms:

        4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

    How  many  distinct  terms  are  in  the  sequence  generated  by  a**b  for
    2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?

                            Answer: 9183
"""

# pylint: disable=invalid-name
def distinct_powers(a, b):
    """Generate distinct terms in a**b"""
    numbers = []

    for i in range(a[0], a[1]+1):
        for j in range(b[0], b[1]+1):
            numbers.append(i**j)

    # Set makes it the numbers values unique
    return set(numbers)

print(len(distinct_powers([2, 100], [2, 100])))
