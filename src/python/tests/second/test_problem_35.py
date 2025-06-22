from project_euler.second.problem_35 import circular_primes, is_circular_prime


def test_is_circular_prime_true() -> None:
    assert is_circular_prime(2)


def test_is_circular_prime_false() -> None:
    assert not is_circular_prime(4)


def test_is_circular_prime_example() -> None:
    assert is_circular_prime(197)


def test_circular_primes_example() -> None:
    assert 13 == circular_primes(100)


def test_circular_primes_wanted() -> None:
    assert 55 == circular_primes(1_000_000)
