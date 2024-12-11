# devtools::test_active_file(file = 'tests/testthat/test.problem-26.R')
context('Testing problem 26')

test_that('Given example', {
  input <- 10
  output <- 7

  expect_equal(problem26(input), output)
})

test_that('Wanted example', {
  input <- 1000
  output <- 983

  expect_equal(problem26(input), output)
})