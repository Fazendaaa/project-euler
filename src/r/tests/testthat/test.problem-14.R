# devtools::test_active_file(file = 'tests/testthat/test.problem-14.R')
context("Testing problem 14")

test_that("Collatz Sequence Recursive given example", {
  input <- 13
  output <- c(13, 40, 20, 10, 5, 16, 8, 4, 2, 1)

  expect_equal(collatzSequenceRecursive(input), output)
})

test_that("Collatz Sequence Loop given example", {
  input <- 13
  output <- c(13, 40, 20, 10, 5, 16, 8, 4, 2, 1)

  expect_equal(collatzSequenceLoop(input), output)
})

test_that("Collatz Sequence Memoization given example", {
  input <- 13
  output <- c(13, 40, 20, 10, 5, 16, 8, 4, 2, 1)

  expect_equal(collatzSequenceMemoization(input), output)
})

test_that("Given example", {
  input <- 13
  output <- 9

  expect_equal(problem14(input), output)
})

test_that("Question", {
  input <- 1000000
  output <- 837799

  expect_equal(problem14(input), output)
})
