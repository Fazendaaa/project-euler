"""
                                Counting Sundays

    You  are  given  the  following  information,  but you may prefer to do some
    research for yourself.

        *   1 Jan 1900 was a Monday.
        *   Thirty days has September,
            April, June and November.
            All the rest have thirty-one,
            Saving February alone,
            Which has twenty-eight, rain or shine.
            And on leap years, twenty-nine.
        *   A  leap  year occurs on any year evenly divisible by 4, but not on a
            century unless it is divisible by 400.

    How many Sundays fell on the first of the month during the twentieth century
    (1 Jan 1901 to 31 Dec 2000)?

                                Answer: 171
    Helped me out:
        *   http://stackoverflow.com/a/1060330/7092954
"""

from datetime import timedelta, date

def daterange(start, finish):
    """Iterate over given date range"""
    for delta in range(int((finish-start).days)):
        yield start+timedelta(delta)

START = date(1901, 1, 1)
FINISH = date(2000, 12, 31)
# pylint: disable=misplaced-comparison-constant
SUNDAYS = [x for x in daterange(START, FINISH) if 1 == x.day and 1 == x.weekday()]
print(len(SUNDAYS))
