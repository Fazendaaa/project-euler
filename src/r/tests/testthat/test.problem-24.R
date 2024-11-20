# devtools::test_active_file(file = 'tests/testthat/test.problem-24.R')
context('Testing problem 24')

test_that('Given example permutations', {
  interval <- 0:2
  result <- permutations(interval)
  output <- matrix(nrow = 6, ncol = 3)

  output[1,] <- c(0, 1, 2)
  output[2,] <- c(1, 0, 2)
  output[3,] <- c(1, 2, 0)

  output[4,] <- c(0, 2, 1)
  output[5,] <- c(2, 0, 1)
  output[6,] <- c(2, 1, 0)

  expect_equal(result, output)
})

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
#  output[5,] <- c(0, 2, 1, 3)
#  output[6,] <- c(2, 0, 3, 1)
#  output[7,] <- c(2, 3, 1, 0)
#  output[8,] <- c(3, 2, 1, 0)
#
#  expect_equal(result, output)
#})

#test_that('Given example', {
#  interval <- 0:2
#  output <- c('012', '021', '102', '120', '201', '210')
#  result <- problem24(interval)
#
#  expect_equal(result, output)
#})

#test_that('Wanted example', {
#  interval <- 0:9
#  index <- 100000
#  output <- '2783915460'
#
#  expect_equal(problem24(interval)[index], output)
#})