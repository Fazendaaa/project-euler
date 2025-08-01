from project_euler.project_euler import eratosthenes_sieve, is_prime


def test_eratosthenes_sieve_first() -> None:
    assert {2} == eratosthenes_sieve(2)


def test_eratosthenes_sieve_second() -> None:
    assert {2, 3, 5, 7, 11} == eratosthenes_sieve(11)


def test_is_prime_true() -> None:
    assert is_prime(197)


def test_is_prime_false() -> None:
    assert not is_prime(4)
