context("Testing problem 7")

test_that("Given example", {
    input <- 6
    output <- 13

    expect_equal(problem7(input), output)
})

test_that("Wanted value", {
    input <- 10001
    output <- 104743

    expect_equal(problem7(input), output)
})
