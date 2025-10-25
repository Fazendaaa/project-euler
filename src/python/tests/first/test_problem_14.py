from pytest import raises

from project_euler.first.problem_14 import collatzSequence, longestCollatzSequence


def test_collatz_error() -> None:
    with raises(ValueError, match="Seed must be greater than 0"):
        collatzSequence(0)


def test_collatz_example() -> None:
    assert [
        13,
        40,
        20,
        10,
        5,
        16,
        8,
        4,
        2,
        1,
    ] == collatzSequence(13), "Test example didn't pass"


def test_longest_collatz() -> None:
    # Seed  Sequence
    #       Length
    #   1      1
    #   2      2
    #   3      8
    #   4      3
    #   5      6
    #   6      9
    #   7      17
    #   8      4
    #   9      20
    #   10     7
    #
    assert 9 == longestCollatzSequence(10), "Test longest Collatz didn't pass"


def test_longest_collatz_wanted() -> None:
    assert 837_799 == longestCollatzSequence(
        1_000_000
    ), "Test longest Collatz wanted didn't pass"
