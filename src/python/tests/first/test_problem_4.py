from project_euler.first.problem_4 import numericPalindrome


def test_example() -> None:
    assert 9_009 == numericPalindrome(2, 2)[-1]


def test_wanted() -> None:
    assert 906_609 == numericPalindrome(3, 2)[-1]
