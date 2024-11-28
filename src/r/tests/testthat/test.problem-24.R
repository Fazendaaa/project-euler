# devtools::test_active_file(file = 'tests/testthat/test.problem-24.R')
context('Testing problem 24')

test_that('Given example package', {
  interval <- 0:2
  output <- matrix(c(0, 0, 1,
                     1, 2, 2,
                     1, 2, 0,
                     2, 0, 1,
                     2, 1, 2,
                     0, 1, 0), nrow = 6)

  expect_equal(generateLexicographicPermutations(interval), output)
})

test_that('Wanted example package', {
  interval <- 0:9
  index <- 1000000
  output <- '2783915460'

  expect_equal(problem24Pkg(interval, index), output)
})

test_that('Wanted example', {
  interval <- 0:9
  index <- 1000000
  output <- '2783915460'

  expect_equal(problem24(interval, index), output)
})