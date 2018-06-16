--                             Counting Sundays

-- You  are  given  the  following  information,  but you may prefer to do some
-- research for yourself.

--     *   1 Jan 1900 was a Monday.
--     *   Thirty days has September,
--         April, June and November.
--         All the rest have thirty-one,
--         Saving February alone,
--         Which has twenty-eight, rain or shine.
--         And on leap years, twenty-nine.
--     *   A  leap  year occurs on any year evenly divisible by 4, but not on a
--         century unless it is divisible by 400.

-- How many Sundays fell on the first of the month during the twentieth century
-- (1 Jan 1901 to 31 Dec 2000)?

--                             Answer: 171

import Data.Time.Calendar (Day, addDays, fromGregorian, toGregorian)
import Data.Time.Calendar.WeekDate (toWeekDate)

sumFirstSundays :: Day -> Day -> Integer
sumFirstSundays start end = go start end 0 where
    go begin finished _
        | begin > finished = 0
    go begin finished count = count + result where
        (_, _, weekDay) = toWeekDate begin
        (_, _, day) = toGregorian begin
        next = go (addDays 1 begin) finished count
        result = if (7 == weekDay && 1 == day) then 1 + next else next

main :: IO()
main = do
    let start = fromGregorian 1901 1 1
    let end = fromGregorian 2000 21 31
    print $ sumFirstSundays start end
