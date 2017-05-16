# pylint: disable=line-too-long
"""
                            Maximum path sum I

    By  starting at the top of the triangle below and moving to adjacent numbers
    on the row below, the maximum total from top to bottom is 23.

                                   3
                                  7 4
                                 2 4 6
                                8 5 9 3

    That is, 3 + 7 + 4 + 9 = 23.
    Find the maximum total from top to bottom of the triangle below:

                                  75
                                 95 64
                                17 47 82
                               18 35 87 10
                             20 04 82 47 65
                            19 01 23 75 03 34
                           88 02 77 73 07 63 67
                          99 65 04 28 06 16 70 92
                        41 41 26 56 83 40 80 70 33
                       41 48 72 33 47 32 37 16 94 29
                      53 71 44 65 25 43 91 52 97 51 14
                    70 11 33 28 77 73 17 78 39 68 17 57
                   91 71 52 38 17 14 91 43 58 50 27 29 48
                  63 66 04 68 89 53 67 30 73 16 69 87 40 31
                04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

    NOTE:  As  there are only 16384 routes, it is possible to solve this problem
    by  trying  every  route.  However, Problem 67, is the same challenge with a
    triangle  containing  one-hundred  rows; it cannot be solved by brute force,
    and requires a clever method! ;o)

                                Answer: 1074

    note: articles that helped me out:
        * https://www.quora.com/What-is-an-algorithm-to-find-a-longest-path-in-a-unweighted-directed-acyclic-graph
        * http://cs.stackexchange.com/questions/11263/longest-path-in-an-undirected-tree-with-only-one-traversal/11264#11264
        * https://rosettacode.org/wiki/Dijkstra's_algorithm#Ruby
        * http://stackoverflow.com/questions/8002252/euler-project-18-approach/8002423#8002423
"""

import copy
import sys
sys.path.append('../')
# pylint: disable=wrong-import-position,import-error
import project_euler as pe

def maximum_path_sum(tri):
    """Iterate over triangle seeking for the longest path"""
    path = copy.copy(tri)

    #   The bottom-up apṕroach is much more effective -- like seeking for an way
    #   out  of  a labirint begining at the exit going all they way to the start
    #   point
    for i in reversed(range(len(path))):
        maximum = []
        for cons in pe.each_cons(path[i], 2):
            maximum.append(max(cons))
        path[i-1] = [greater+number for greater, number in zip(maximum, path[i-1])]

    return path[0][0]

with open('./input/problem_18.txt', 'r') as file:
    TRIANGLE = [list(map(int, line.split())) for line in file]
    print(maximum_path_sum(TRIANGLE))
