context("Testing problem 6")

test_that("Given example", {
    input <- 10
    output <- 2640

    expect_equal(problem6(input), output)
})

test_that("Wanted value", {
    input <- 100
    output <- 25164150

    expect_equal(problem6(input), output)
})
