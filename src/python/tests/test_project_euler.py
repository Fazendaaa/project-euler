from project_euler.project_euler import eratosthenes_sieve, is_prime, prime_factors


def test_prime_factors_example_exercise_three() -> None:
    assert [5, 7, 13, 29] == prime_factors(13_195)


def test_prime_factors() -> None:
    assert [2, 2, 3, 7] == prime_factors(84)


def test_eratosthenes_sieve() -> None:
    assert {
        2,
        3,
        5,
        7,
        11,
        13,
        17,
        19,
        23,
        29,
        31,
        37,
        41,
        43,
        47,
    } == eratosthenes_sieve(50)


def test_is_prime() -> None:
    assert is_prime(2)
    assert is_prime(3)
    assert not is_prime(4)
    assert not is_prime(6)
