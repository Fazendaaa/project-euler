# devtools::test_active_file(file = 'tests/testthat/test.problem-26.R')
context('Testing problem 26')

test_that('Wanted example', {
  output <- 983

  expect_equal(problem26(), output)
})