"""
                                Names scores

    Using  problem_22.txt,  a  46K text file containing over five-thousand first
    names,  begin  by  sorting  it into alphabetical order. Then working out the
    alphabetical  value  for  each name, multiply this value by its alphabetical
    position in the list to obtain a name score.

    For  example,  when the list is sorted into alphabetical order, COLIN, which
    is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
    would obtain a score of 938 × 53 = 49714.

    What is the total of all the name scores in the file?

                            Answer: 871198282

    obs: articles that helped me out:
        *   http://stackoverflow.com/a/5545284/7092954
"""

def order(letter):
    """Given letter, returns it alphabetic index"""
    return ord(str.lower(letter))-96

def names_scores(names):
    """Given a list of names, sorted it into alphabetical order then calculates \
    alphabetical value for eache name by multiplying this value by its alphabetical \
    postion int the list to obtain a name score"""
    # pylint: disable=line-too-long
    return sum([sum(list(map(order, list(value))))*(index+1) for index, value in enumerate(sorted(names))])

with open('./input/problem_22.txt', 'r') as file:
    NAMES = file.read().replace("\"", '').split(',')
    print(names_scores(NAMES))
