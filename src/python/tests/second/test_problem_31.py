from project_euler.second.problem_31 import coin_sums


def test_expected() -> None:
    assert 73682 == coin_sums([1, 2, 5, 10, 20, 50, 100, 200], 200)
