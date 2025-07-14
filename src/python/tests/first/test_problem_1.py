from project_euler.first.problem_1 import sumMultiples


def test_example() -> None:
    assert 23 == sumMultiples(10)


def test_wanted() -> None:
    assert 233168 == sumMultiples(1_000)
