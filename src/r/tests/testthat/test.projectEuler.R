context("Testing factors")

test_that("Input equals to 10", {
    input <- 10
    output <- c(1, 2, 5, 10)

    expect_equal(factors(input), output)
})

test_that("Input equals to 48", {
    input <- 48
    output <- c(1, 2, 3, 4, 6, 8, 12, 16, 24, 48)

    expect_equal(factors(input), output)
})

test_that("Input equals to 150", {
    input <- 150
    output <- c(1, 2, 3, 5, 6, 10, 15, 25, 30, 50, 75, 150)

    expect_equal(factors(input), output)
})

context("Testing isPrime")

test_that("Input equals to 1", {
    input <- 1
    output <- FALSE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 2", {
    input <- 2
    output <- TRUE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 3", {
    input <- 3
    output <- TRUE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 10", {
    input <- 10
    output <- FALSE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 13", {
    input <- 13
    output <- TRUE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 35", {
    input <- 35
    output <- FALSE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 48", {
    input <- 48
    output <- FALSE

    expect_equal(isPrime(input), output)
})

test_that("Input equals to 150", {
    input <- 150
    output <- FALSE

    expect_equal(isPrime(input), output)
})
