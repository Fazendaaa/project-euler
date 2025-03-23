# devtools::test_active_file(file = 'tests/testthat/test.problem-28.R')
context('Testing problem 28')

test_that('Given example', {
  input <- 5
  output <- 101

  expect_equal(problem28(input), output)
})

test_that('Wanted example', {
  input <- 1001
  output <- 669171001

  expect_equal(problem28(input), output)
})