context("Testing problem 1")

test_that("Given example", {
    input <- 10
    output <- 23

    expect_equal(problem1(input), output)
})

test_that("Wanted value", {
    input <- 1000
    output <- 233168

    expect_equal(problem1(input), output)
})

test_that("Passing a character", {
    input <- "a"
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

test_that("Passing a vector", {
    input <- c("a")
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

test_that("Passing a NA object", {
    input <- NA
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

test_that("Passing a NULL object", {
    input <- NULL
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

test_that("Passing a NaN object", {
    input <- NaN
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

test_that("Passing a Inf object", {
    input <- Inf
    output <- "value must be a positive integer"

    expect_error(problem1(input), output)
})

# TODO(Fazenda): write new tests
