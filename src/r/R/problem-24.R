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

injection <- function(first, remaining) {
  combinations <- list()

  for (i in remaining)  {
    combinations <- list(combinations, list(first, i), list(i, remaining))
  }

  return (combinations)
}

permutations <- function(interval) {
  if (1 == length(interval)) {
    return (interval)
  }

  return (c(injection(interval[1], permutations(interval[-1]))))
}

#'
#' @export
#'
problem24 <- function(interval) {
  permutations <- permutations(interval)

  return (unlist(Map(function(x) paste(as.character(x), collapse=''), permutations)))
}