context("Testing problem 1")

test_that("[Valid] Given example", {
    input <- 10
    output <- 23

    expect_equal(myFunc(input), output)
})

test_that("[Valid] Wanted value", {
    input <- 1000
    output <- 233168

    expect_equal(myFunc(input), output)
})

test_that("[Error] Passing a character", {
    input <- 'a'
    output <- 'value must be a positive integer'

    expect_error(myFunc(input), output)
})

test_that("[Error] Passing a list", {
    input <- c('a')
    output <- 'value must be a positive integer'

    expect_error(myFunc(input), output)
})

test_that("[Error] Passing a NA object", {
    input <- NA
    output <- 'value must be a positive integer'

    expect_error(myFunc(input), output)
})

test_that("[Error] Passing a NULL object", {
    input <- NULL
    output <- 'value must be a positive integer'

    expect_error(myFunc(input), output)
})

test_that("[Error] Passing a Inf object", {
    input <- Inf
    output <- 'result would be too long a vector'

    expect_error(myFunc(input), output)
})

test_that("[Error] Passing a NaN object", {
    input <- NaN
    output <- 'missing value where TRUE/FALSE needed'

    expect_error(myFunc(input), output)
})

# TODO(Fazenda): write new tests
