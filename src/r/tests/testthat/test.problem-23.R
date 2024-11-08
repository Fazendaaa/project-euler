# devtools::test_active_file(file = 'tests/testthat/test.problem-23.R')
context('Testing problem 23')

test_that('Given 28 example', {
  input <- 28
  output <- 28

  expect_equal(sumsDivisors(input), output)
})

test_that('Given 12 example', {
  input <- 12
  output <- 16

  expect_equal(sumsDivisors(input), output)
})

test_that('Wanted example', {
  input <- 28123
  output <- 4179871

  expect_equal(problem23(input), output)
})
