from project_euler.second.problem_30 import digit_powers


def test_problem_30():
    assert 443839 == sum(digit_powers(5))
