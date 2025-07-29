from project_euler.first.problem_5 import smallest_multiple


def test_example() -> None:
    assert 2_520 == smallest_multiple(10)


def test_wanted() -> None:
    assert 232_792_560 == smallest_multiple(20)
