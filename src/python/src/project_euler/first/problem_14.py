#                     Longest Collatz sequence
#
# The  following  iterative  sequence  is  defined  for  the  set  of positive
# integers:
#
#                         n → n/2 (n is even)
#                         n → 3n + 1 (n is odd)
#
# Using  the  rule  above  and  starting  with  13,  we generate the following
# sequence:
#
#             13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
#                             Answer: 837799
#

from concurrent.futures import ThreadPoolExecutor, as_completed

MEMOIZATION: dict[int, list[int]] = {}


def collatzSequence(
    seed: int,
) -> list[int]:
    """
    Generate the Collatz sequence starting from a given seed number.

    Args:
        seed (int): The starting number for the sequence

    Returns:
        list[int]: The complete Collatz sequence starting from seed

    Raises:
        ValueError: If seed is less than 1
    """
    sequence = [seed]

    if seed < 1:
        raise ValueError("Seed must be greater than 0")

    if 1 == seed:
        return sequence

    if seed in MEMOIZATION:
        return MEMOIZATION[seed]

    MEMOIZATION[seed] = sequence + collatzSequence(
        3 * seed + 1 if seed % 2 else seed // 2,
    )

    return MEMOIZATION[seed]


def lenCollatzSequence(
    seed: int,
) -> dict[int, int]:
    """
    Calculate the length of the Collatz sequence for a given seed number.

    Args:
        seed (int): The starting number for the sequence

    Returns:
        dict[int, int]: Dictionary with seed as key and sequence length as value
    """
    return {seed: len(collatzSequence(seed))}


def longestCollatzSequence(
    limit: int,
) -> int:
    """
    Find the number that produces the longest Collatz sequence under a given limit.

    Args:
        limit (int): Upper bound for starting numbers to check

    Returns:
        int: The starting number that produces the longest sequence

    Raises:
        RuntimeError: If no sequence is found (should never happen)
    """
    with ThreadPoolExecutor() as executor:
        futures = [
            executor.submit(lenCollatzSequence, index) for index in range(1, limit + 1)
        ]
        result = [future.result() for future in as_completed(futures)]
        maximum = max(result, key=lambda x: list(x.values())[0])
        key, _ = list(maximum.items())[0]

        return key

    raise RuntimeError("This should never happen")
