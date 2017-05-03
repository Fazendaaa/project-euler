"""
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
"""
import sys
sys.path.append('../')
# pylint: disable=wrong-import-position,import-error
import project_euler as pe

# pylint: disable=redefined-builtin
def largest_prime(max):
    """Given max this function returns the largest prime factor"""
    return pe.prime_factors(max)[-1]

print(largest_prime(600851475143))
