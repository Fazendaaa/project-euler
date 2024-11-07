# devtools::test_active_file(file = 'tests/testthat/test.problem-22.R')
context("Testing problem 22")

test_that("Given example", {
  input <- c(index = 938)
  input[[2]] <- 'COLIN'
  output <- 49714

  expect_equal(nameWeight(input), output)
})

test_that("Wanted example", {
  input <- system.file('data', 'problem_22.txt', package = 'projectEuler')
  output <- 871198282

  expect_equal(problem22(input), 871198282)
})
