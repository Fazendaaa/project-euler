context("Testing problem 4")

test_that("Given example", {
    input <- 2
    output <- 9009

    expect_equal(problem4(input), output)
})

test_that("Wanted value", {
    input <- 3
    output <- 906609

    expect_equal(problem4(input), output)
})
