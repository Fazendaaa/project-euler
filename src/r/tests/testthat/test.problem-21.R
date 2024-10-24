# devtools::test_active_file(file = 'tests/testthat/test.problem-21.R')
context("Testing problem 21")

test_that("Divisors of 220", {
  input <- 220
  output <- c(1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110, 220)

  expect_equal(allDivisors(input), output)
})

test_that("Divisors of 284", {
  input <- 284
  output <- c(1, 2, 4, 71, 142, 284)

  expect_equal(allDivisors(input), output)
})

test_that("Amicable numbers given example", {
  input <- 285
  output <- 504

  expect_equal(problem21(input), output)
})

test_that("Amicable numbers wanted example", {
  input <- 10000
  output <- 31626

  expect_equal(problem21(input), output)
})
