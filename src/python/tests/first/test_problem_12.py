from project_euler.first.problem_12 import highly_divisible_triangular


def test_example() -> None:
    assert 28 == highly_divisible_triangular(5)


def test_wanted() -> None:
    assert 76_576_500 == highly_divisible_triangular(500)
