# devtools::test_active_file(file = 'tests/testthat/test.problem-27.R')
context('Testing problem 27')

#test_that('Given example', {
#  input <- 10
#  output <- 7
#
#  expect_equal(problem27(input), output)
#})

test_that('Wanted example', {
  input <- 1000
  output <- -59231

  expect_equal(problem27(input), output)
})