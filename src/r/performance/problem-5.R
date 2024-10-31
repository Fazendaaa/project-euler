# Rscript performance/problem-5.R
library(profvis)
library(htmlwidgets)
library(testthat)
library(projectEuler)

example <- profvis({
  input <- 10
  output <- 2520

  expect_equal(problem5(input), output)
})

wanted <- profvis({
  input <- 20
  output <- 232792560

  expect_equal(problem5(input), output)
})

saveWidget(example, 'inst/data/example.html')
saveWidget(wanted, 'inst/data/wanted.html')
