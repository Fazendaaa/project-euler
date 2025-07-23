from project_euler.first.problem_2 import fibonacci_numbers, sum_even_fibonacci_numbers


def test_example() -> None:
    assert [1, 2, 3, 5, 8, 13, 21, 34, 55, 89] == fibonacci_numbers(90)


def test_wanted() -> None:
    assert 4_613_732 == sum_even_fibonacci_numbers(4_000_000)
