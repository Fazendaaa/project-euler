# devtools::test_active_file(file = 'tests/testthat/test.problem-23.R')
context('Testing problem 23')

#test_that('Given 28 example', {
#  input <- 28
#  output <- 28
#
#  expect_equal(sumDivisors(input), output)
#})
#
#test_that('Given 12 example', {
#  input <- 12
#  output <- 16
#
#  expect_equal(sumDivisors(input), output)
#})
#
#test_that('Basic "getAllAbundant" example [read inst/excalidraw/exercise-23.excalidraw]', {
#  input <- 24
#  output <- c(12, 18, 20, 24)
#
#  expect_equal(getAllAbundant(input), output)
#})
#
#test_that('Basic "getAllAbundant" per Wikipeda', {
#  input <- 120
#  output <- c(12, 18, 20, 24, 30, 36, 40, 42, 48, 54, 56, 60, 66, 70, 72, 78,
#              80, 84, 88, 90, 96, 100, 102, 104, 108, 112, 114, 120)
#
#  expect_equal(getAllAbundant(input), output)
#})
#
#test_that('Basic "sumOfTwoNumbers" example [read inst/excalidraw/exercise-23.excalidraw]', {
#  input <- c(12, 18, 20, 24)
#  howManyTimesItAppears <- length(input) + 1
#  output <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), input, 0)
#
#  expect_equal(sumOfTwoNumbers(input), output)
#})
#
#test_that('Basic "sumOfTwoNumbers" per Wikipeda', {
#  input <- c(12, 18, 20, 24, 30, 36, 40, 42, 48, 54, 56, 60, 66, 70, 72, 78,
#              80, 84, 88, 90, 96, 100, 102, 104, 108, 112, 114, 120)
#  howManyTimesItAppears <- length(input) + 1
#  output <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), input, 0)
#
#  expect_equal(sumOfTwoNumbers(input), output)
#})
#
#test_that('Basic "problem23" example [read inst/excalidraw/exercise-23.excalidraw]', {
#  input <- 24
#  allAbundant <- c(12, 18, 20, 24)
#  howManyTimesItAppears <- length(allAbundant) + 1
#  output <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), allAbundant, 0)
#
#  expect_equal(problem23(input), output)
#})
#
#test_that('Basic "problem23" per Wikipeda', {
#  input <- 120
#  allAbundant <- c(12, 18, 20, 24, 30, 36, 40, 42, 48, 54, 56, 60, 66, 70, 72,
#                   78, 80, 84, 88, 90, 96, 100, 102, 104, 108, 112, 114, 120)
#  howManyTimesItAppears <- length(allAbundant) + 1
#  output <- Reduce(function(acc, cur) acc + (howManyTimesItAppears * cur), allAbundant, 0)
#
#  expect_equal(problem23(input), output)
#})
#
#test_that('Wanted example', {
#  output <- 4179871
#  result <- problem23()
#
#  print('result')
#  print(result)
#
#  expect_equal(result, output)
#})

test_that('Wanted example', {
  output <- 4179871
  result <- problem23Cpp()

  print('result')
  print(result)

  expect_equal(result, output)
})