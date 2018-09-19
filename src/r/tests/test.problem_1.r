    ncontext("Testing problem 1")

test_that("Given example", {
    input <- 10
    output <- 23
    multiplesOfFive <- seq(5, input - 1, 5)
    multiplesOfThree <- seq(3, input - 1, 3)
    multiplesResult <- sort(c(multiplesOfThree, multiplesOfFive))

    expect_equal(myFunc(input), output)
    expect_equal(multiples(input), output)
})

test_that("Wanted value", {
    input <- 1000
    output <- 233168
    multiplesOfFive <- seq(5, input - 1, 5)
    multiplesOfThree <- seq(3, input - 1, 3)
    multiplesResult <- sort(c(multiplesOfThree, multiplesOfFive))

    expect_equal(myFunc(input), output)
    expect_equal(multiples(input), multiplesResult)
})

# TODO(Fazenda): write new tests
