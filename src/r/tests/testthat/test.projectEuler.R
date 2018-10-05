context("Testing factors")

test_that("Input equals to 10", {
    input <- 10
    output <- c(2, 5)

    expect_equal(factors(input), output)
})
