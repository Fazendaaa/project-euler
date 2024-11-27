# devtools::test_active_file(file = 'tests/testthat/test.problem-24.R')
context('Testing problem 24')

#test_that('Given example permutations', {
#  interval <- 0:2
#  result <- permutations(interval)
#  output <- matrix(nrow = 6, ncol = 3)
#
#  output[1,] <- c(0, 1, 2)
#  output[2,] <- c(1, 0, 2)
#  output[3,] <- c(1, 2, 0)
#
#  output[4,] <- c(0, 2, 1)
#  output[5,] <- c(2, 0, 1)
#  output[6,] <- c(2, 1, 0)
#
#  expect_equal(result, output)
#})

#test_that('permutations of 0 up to 3', {
#  interval <- 0:3
#  result <- permutations(interval)
#  output <- matrix(nrow = 8, ncol = 4)
#
#  output[1,] <- c(3, 0, 1, 2)
#  output[2,] <- c(1, 3, 0, 2)
#  output[3,] <- c(1, 2, 3, 0)
#  output[4,] <- c(1, 2, 0, 3)
#
#  output[5,] <- c(3, 1, 0, 2)
#  output[6,] <- c(1, 3, 0, 2)
#  output[7,] <- c(1, 0, 3, 2)
#  output[8,] <- c(1, 0, 2, 3)
#
#  output[9,]  <- c(3, 1, 2, 0)
#  output[10,] <- c(1, 3, 2, 0)
#  output[11,] <- c(1, 2, 3, 0)
#  output[12,] <- c(1, 2, 0, 3)
#
#  output[13,] <- c(0, 2, 1, 3)
#  output[14,] <- c(2, 0, 3, 1)
#  output[15,] <- c(2, 3, 1, 0)
#  output[16,] <- c(3, 2, 1, 0)
#
#  output[17,] <- c(0, 2, 1, 3)
#  output[18,] <- c(2, 0, 3, 1)
#  output[19,] <- c(2, 3, 1, 0)
#  output[20,] <- c(3, 2, 1, 0)
#
#  output[21,] <- c(3, 0, 1, 2)
#  output[22,] <- c(1, 3, 0, 2)
#  output[23,] <- c(1, 2, 3, 0)
#  output[24,] <- c(1, 2, 0, 3)
#
#  expect_equal(result, output)
#})
#
test_that('Given example', {
  interval <- 0:2
  output <- matrix(c(0, 0, 1,
                     1, 2, 2,
                     1, 2, 0,
                     2, 0, 1,
                     2, 1, 2,
                     0, 1, 0), nrow = 6)

  expect_equal(generateLexicographicPermutations(interval), output)
})

test_that('Wanted example', {
  interval <- 0:9
  index <- 100000
  output <- '2783915460'

  expect_equal(problem24(interval, index), output)
})