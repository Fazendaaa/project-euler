//                             Names scores

// Using  problem_22.txt,  a  46K text file containing over five-thousand first
// names,  begin  by  sorting  it into alphabetical order. Then working out the
// alphabetical  value  for  each name, multiply this value by its alphabetical
// position in the list to obtain a name score.

// For  example,  when the list is sorted into alphabetical order, COLIN, which
// is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
// would obtain a score of 938 × 53 = 49714.

// What is the total of all the name scores in the file?

//                         Answer: 871198282

'use strict';

import { readFileSync } from 'fs';
import { join } from 'path';
import { sum } from '../project_euler';

interface NamesScore {
    name: string;
    score: number;
}

const namesScore = (names: Array<string>): Array<NamesScore> => names.sort().map((name, index) => {
    const score = name.split('').reduce((acc, cur) => acc + (cur.charCodeAt(0) - 96), 0);

    return { name, score: score * (index + 1) };
});

const sumScore = (acc: number, cur: NamesScore): number => acc + cur.score;

const path = '../../1-25/input/problem_22.txt';
const names = readFileSync(join(__dirname, path), 'utf8').toLowerCase().replace(/\"|\"/gm, '').split(',');

console.log(namesScore(names).reduce(sumScore, 0));
