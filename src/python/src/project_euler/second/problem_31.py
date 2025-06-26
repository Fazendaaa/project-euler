"""
                            Coin sums

In  England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

        1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

            1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?

Articles that helped me out:
    *   http://www.geeksforgeeks.org/dynamic-programming-set-7-coin-change/

                        Answer: 73682
"""

from typing import Literal


def coin_sums(coins: list[int], sum: int) -> int:
    """Calculate the number of different ways to make a given value using a set of coins.

    This function uses recursion to find all possible combinations of coins that sum up
    to the target value.

    Args:
        coins (list): List of coin denominations available
        sum (int): The target value to make change for

    Returns:
        int: Number of different ways to make the target value using the given coins

    Example:
        >>> coins = [1, 2, 5]
        >>> coin_sums(coins, 5)
        4  # The combinations are: [1,1,1,1,1], [1,1,1,2], [1,2,2], [5]
    """

    def __coin_sums__(
        coins: list[int], length: int, sum: int
    ) -> int | Literal[1] | Literal[0]:
        if 0 == sum:
            return 1
        if 0 > sum or 0 == length:
            return 0
        return __coin_sums__(coins, length, sum - coins[length - 1]) + __coin_sums__(
            coins, length - 1, sum
        )

    return __coin_sums__(coins, len(coins), sum)
