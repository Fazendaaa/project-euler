context("Testing problem 2")

test_that("Given example", {
    input <- 10
    output <- 10

    expect_equal(problem2(input), output)
})

test_that("Wanted value", {
    input <- 4000000
    output <- 4613732

    expect_equal(problem2(input), output)
})

test_that("Passing a character", {
    input <- "a"
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})

test_that("Passing a list", {
    input <- c("a")
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})

test_that("Passing a NA object", {
    input <- NA
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})

test_that("Passing a NULL object", {
    input <- NULL
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})

test_that("Passing a NaN object", {
    input <- NaN
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})

test_that("Passing a Inf object", {
    input <- Inf
    output <- "value must be a positive integer"

    expect_error(problem2(input), output)
})
