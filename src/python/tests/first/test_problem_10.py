from project_euler.first.problem_10 import summationOfPrimes


def test_example() -> None:
    assert summationOfPrimes(10) == 17


def test_wanted() -> None:
    assert summationOfPrimes(2_000_000) == 142_913_828_922
