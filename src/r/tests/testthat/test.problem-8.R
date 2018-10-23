context("Testing problem 8")

test_that("Given example", {
    input <- 4
    output <- 5832

    expect_equal(problem8(input, filepath = '../../data/problem_8.txt'), output)
})

test_that("Wanted value", {
    input <- 13
    output <- 23514624000

    expect_equal(problem8(input, filepath = '../../data/problem_8.txt'), output)
})
