context("Testing problem 3")

test_that("Given example", {
    input <- 13195
    output <- 29

    expect_equal(problem3(input), output)
})
