from project_euler.first.problem_6 import sum_square_diff


def test_example() -> None:
    assert sum_square_diff(10) == 2_640


def test_wanted() -> None:
    assert sum_square_diff(100) == 25_164_150
