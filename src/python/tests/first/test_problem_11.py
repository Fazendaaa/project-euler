from os.path import join
from re import findall

from project_euler.first.problem_11 import greatest_product


def test_wanted() -> None:
    matrix: list[list[int]] = []

    with open(join("data", "input", "problem_11.txt"), "r") as file:
        for line in file:
            matrix.append([int(number) for number in findall(r"\d+", line)])

    assert greatest_product(matrix, 4) == 70_600_674
