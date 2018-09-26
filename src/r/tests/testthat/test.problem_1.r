library("covr")
library("testthat")
context("Testing problem 1")

test_that("Given example", {
    input <- 10
    output <- 23

    expect_equal(myFunc(input), output)
})

test_that("Wanted value", {
    input <- 1000
    output <- 233168

    expect_equal(myFunc(input), output)
})

report()
# TODO(Fazenda): write new tests
