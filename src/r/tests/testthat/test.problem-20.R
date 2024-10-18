# devtools::test_active_file(file = 'tests/testthat/test.problem-20.R')
context("Testing problem 20")

test_that("Factorial digit sum given example", {
  input <- 10
  output <- 27

  expect_equal(problem20(input), output)
})

test_that("Factorial digit sum wanted example", {
  input <- 100
  output <- 648

  expect_equal(problem20(input), output)
})
