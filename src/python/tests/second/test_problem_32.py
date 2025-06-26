from project_euler.second.problem_32 import isPandigital, pandigitalProducts


def test_isPandigital_first() -> None:
    assert isPandigital(15234)


def test_isPandigital_second() -> None:
    assert not isPandigital(2)


def test_isPandigital_third() -> None:
    assert not isPandigital(1523)


def test_isPandigital_fourth() -> None:
    assert not isPandigital(115234)


def test_isPandigital_fifth() -> None:
    assert not isPandigital(1230)


def test_wanted() -> None:
    assert 45228 == pandigitalProducts(9)
