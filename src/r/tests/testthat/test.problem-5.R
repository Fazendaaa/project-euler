# devtools::test_active_file(file = 'tests/testthat/test.problem-5.R')
context("Testing problem 5")

test_that("Given example", {
    input <- 10
    output <- 2520

    expect_equal(problem5(input), output)
})

test_that("Wanted value", {
    input <- 20
    output <- 232792560

    expect_equal(problem5(input), output)
})
