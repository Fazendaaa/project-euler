# devtools::test_active_file(file = 'tests/testthat/test.problem-24.R')
context('Testing problem 24')

test_that('Wanted example', {
  output <- 2783915460

  expect_equal(problem24(), output)
})