from project_euler.second.problem_30 import digit_powers


def test_problem_30_example() -> None:
    assert 19316 == sum(digit_powers(4))


def test_problem_30_wanted() -> None:
    assert 443839 == sum(digit_powers(5))
