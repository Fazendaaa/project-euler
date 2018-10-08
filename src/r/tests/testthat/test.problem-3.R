context("Testing problem 3")

test_that("Given example", {
    input <- 13195
    output <- 29

    expect_equal(problem3(input), output)
})

skip("Not in a performatic way")

test_that("Wanted value", {
    input <- 600851475143
    output <- 6857

    expect_equal(problem3(input), output)
})
