from project_euler.first.problem_3 import largest_prime


def test_example() -> None:
    assert 29 == largest_prime(13_195)


def test_wanted() -> None:
    assert 6_857 == largest_prime(600_851_475_143)
