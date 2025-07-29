from project_euler.project_euler import prime_factors


def test_prime_factors_example_exercise_three() -> None:
    assert [5, 7, 13, 29] == prime_factors(13_195)


def test_prime_factors() -> None:
    assert [2, 2, 3, 7] == prime_factors(84)
