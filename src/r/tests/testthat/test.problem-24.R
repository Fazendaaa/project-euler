# devtools::test_active_file(file = 'tests/testthat/test.problem-24.R')
context('Testing problem 24')

test_that('Given example', {
  interval <- 0:2
  output <- c('012', '021', '102', '120', '201', '210')
  result <- problem24(interval)

  print('result')
  print(result)

  expect_equal(result, output)
})

#test_that('Wanted example', {
#  interval <- 0:9
#  index <- 100000
#  output <- '2783915460'
#
#  expect_equal(problem24(interval)[index], output)
#})