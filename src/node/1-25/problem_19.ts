//                             Counting Sundays

// You  are  given  the  following  information,  but you may prefer to do some
// research for yourself.

//     *   1 Jan 1900 was a Monday.
//     *   Thirty days has September,
//         April, June and November.
//         All the rest have thirty-one,
//         Saving February alone,
//         Which has twenty-eight, rain or shine.
//         And on leap years, twenty-nine.
//     *   A  leap  year occurs on any year evenly divisible by 4, but not on a
//         century unless it is divisible by 400.

// How many Sundays fell on the first of the month during the twentieth century
// (1 Jan 1901 to 31 Dec 2000)?

//                             Answer: 171

'use strict';

import { range } from '../project_euler';

const toDate = (value: number): Date => new Date(value);

const firstSundays = (value: Date): boolean => (1 === value.getDate() && 0 === value.getDay());

// Days to milliseconds.
const day = 1000 * 60 * 60 * 24 * 1;
const end = Date.UTC(2000, 12, 31, 0, 0, 0, 0);
const start = Date.UTC(1901, 1, 1, 0, 0, 0, 0);
const result = range({ start, end, step: day }).map(toDate).filter(firstSundays);

console.log(result.length);
