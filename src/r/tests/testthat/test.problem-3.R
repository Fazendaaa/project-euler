context("Testing problem 3")

skip("Woking on projectEuler.R")

test_that("Given example", {
    input <- double(13195)
    output <- 29

    expect_equal(problem3(input), output)
})
