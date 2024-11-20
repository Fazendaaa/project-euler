#                           Lexicographic permutations
#
#   A permutation is an ordered arrangement of objects. For example, 3124 is one
#   possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
#   are  listed  numerically  or alphabetically, we call it lexicographic order.
#   The lexicographic permutations of 0, 1 and 2 are:
#
#                       012   021   102   120   201   210
#
#   What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
#   5, 6, 7, 8 and 9?
#
#	                						Answer: 2783915460

permutations <- function(interval) {
  if (1 == length(interval)) {
    return (matrix(interval))
  }

  pivot <- interval[1]
  result <- permutations(interval[-1])
  newMatrix <- matrix(nrow = (nrow(result) - 1) + 2, ncol = ncol(result) + 1)
  totalLines <- nrow(newMatrix)
  totalColumns <- ncol(newMatrix)
  middlePoint <- ceiling(totalLines / 2)
  line <- 0
  divisionPoint <- 0
  firstPart <- c()
  secondPart <- c()

  print('0/2')
  print(middlePoint)

  while (line < middlePoint) {
    line <- line + 1
    divisionPoint <- line - 1
    print('divisionPoint')
    print(divisionPoint)
    firstPart <- if(0 < divisionPoint) result[ line, 1 : divisionPoint ] else c()
    print('firstPart')
    print(firstPart)
    secondPart <- result[ line, divisionPoint + 1 : ncol(result) ]
    print('secondPart')
    print(secondPart)
    newMatrix[line, ] <- c(firstPart, pivot, secondPart)
  }

  print('1/2')
  print(newMatrix)

  while (line < totalLines) {
    divisionPoint <- totalColumns - line
    firstPart <- result[ line, 1 : divisionPoint ]
    secondPart <- if(1 < divisionPoint) result[ line, divisionPoint : ncol(result) ] else c()
    line <- line + 1
    newMatrix[line, ] <- c(firstPart, pivot, secondPart)
  }

  print('2/2')
  print(newMatrix)

  return (newMatrix)
}

permutations(0:2)

#'
#' @export
#'
problem24 <- function(interval) {
  permutations <- permutations(interval)

  return (unlist(Map(function(x) paste(as.character(x), collapse=''), permutations)))
}