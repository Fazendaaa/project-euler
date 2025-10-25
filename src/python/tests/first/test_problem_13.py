from os.path import join

from project_euler.first.problem_13 import largeSum


def test_wanted() -> None:
    with open(join("data", "input", "problem_13.txt"), "r") as file:
        assert 5_537_376_230 == largeSum([int(x) for x in file.readlines()])
