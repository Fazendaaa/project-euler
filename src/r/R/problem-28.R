#                          Number spiral diagonals
#
#   Starting  with the number 1 and moving to the right in a clockwise direction
#   a 5 by 5 spiral is formed as follows:
#
#                              21 22 23 24 25
#                              20  7  8  9 10
#                              19  6  1  2 11
#                              18  5  4  3 12
#                              17 16 15 14 13
#
#  It can be verified that the sum of the numbers on the diagonals is 101.
#
#  What  is  the  sum  of the numbers on the diagonals in a 1001 by 1001 spiral
#  formed in the same way?
#
#                             Answer: 669171001

numberSpiralDiagonals <- function(limit) {
  spiral <- c(1)
  side <- 2
  current <- 1

  while (side < limit) {
    for (i in 1:4) {
      current <- current + side
      spiral <- c(spiral, current)
    }

    side <- side + 2
  }

  return (spiral)
}

#'
#' @export
#'
problem28 <- function(limit) sum(numberSpiralDiagonals(limit))