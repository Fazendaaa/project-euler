# devtools::test_active_file(file = 'tests/testthat/test.problem-25.R')
context('Testing problem 25')

test_that('Given example', {
  input <- 3
  output <- 12

  expect_equal(problem25R(input), output)
})

test_that('Wanted example R', {
  input <- 1000
  output <- 4782

  expect_equal(problem25R(input), output)
})

test_that('Wanted example CPP', {
  input <- 1000
  output <- 4782

  expect_equal(problem25CPP(input), output)
})