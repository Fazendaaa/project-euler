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
#
#   References:
#
#     * https://web.archive.org/web/20170617093226/http://www.mathblog.dk/project-euler-24-millionth-lexicographic-permutation/
#

#'
#' @importFrom gtools permutations
#'
generateLexicographicPermutations <- function(interval) {
  return (permutations(n = length(interval), r = length(interval), v = interval))
}

problem24Pkg <- function(interval, index) {
  result <- generateLexicographicPermutations(interval)

  return (paste(result[index, ], collapse = ""))
}

factor <- function(number) {
  product <- 1
  index <- 1

  if (number < 0) {
    return (0);
  }

  while (index <= number) {
    product <- product * index
    index <- index + 1
  }

  return (product)
}

#'
#' @export
#'
problem24 <- function(interval, index) {
  size <- length(interval)
  permutationNumber <- ''
  remain <- index - 1
  numbers <- seq(0, size - 1)
  sizeNumbers <- length(numbers)
  outerIndex <- size

  while (outerIndex >= 1) {
    innerIndex <- remain %/% factor(outerIndex - 1)
    remain <- remain %% factor(outerIndex - 1)

    permutationNumber <- paste0(permutationNumber, numbers[innerIndex + 1])
    numbers <- numbers[-(innerIndex + 1)]

    if (0 == remain) {
      break
    }

    outerIndex <- outerIndex - 1
  }

  outerIndex <- 0
  sizeNumbers <- length(numbers)
  limit <- sizeNumbers - 1

  while (outerIndex <= limit) {
    permutationNumber <- paste0(permutationNumber, numbers[outerIndex + 1])
    outerIndex <- outerIndex + 1
  }

  return (permutationNumber)
}