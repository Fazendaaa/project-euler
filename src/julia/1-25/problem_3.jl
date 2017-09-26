#=
                            Largest prime factor

    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?

                            Answer: 6857
=#

include("../project_euler.jl")
using project_euler

print(pop!(prime_factors(600851475143)), "\n")
