# devtools::test_active_file(file = 'tests/testthat/test.problem-25.R')
context('Testing problem 25')

test_that('Given example memoised', {
  input <- 3
  output <- 12

  expect_equal(problem25memoise(input), output)
})

test_that('Given example', {
  input <- 3
  output <- 12

  expect_equal(problem25(input), output)
})

test_that('Wanted example', {
  input <- 1000
  output <- 4782

  expect_equal(problem25(input), output)
})

#test_that('Wanted example', {
#  input <- 1000
#  output <- 4782
#
#  expect_equal(problem25memoise(input), output)
#})