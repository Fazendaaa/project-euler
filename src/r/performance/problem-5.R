#!/bin/Rscript
# Rscript performance/problem-5.R
library(projectEuler)
library(ggplot2)
library(plotly)
library(htmlwidgets)
library(reshape2)

example <- profvis::profvis({
  input <- 10
  output <- 2520

  testthat::expect_equal(problem5(input), output)
})

wanted <- profvis::profvis({
  input <- 20
  output <- 232792560

  testthat::expect_equal(problem5(input), output)
})

toMaintain <- c('time', 'memalloc')

dfExample <- example[['x']][['message']][['prof']]
dfWanted <- wanted[['x']][['message']][['prof']]
dfExample <- tail(dfExample[toMaintain], n = 1)
dfWanted <- tail(dfWanted[toMaintain], n = 1)

dfExample[['implementation']] <- c('example')
dfWanted[['implementation']] <- c('wanted')

merged <- merge(dfExample, dfWanted, all = TRUE)
write.table(merged, 'inst/merged.csv', sep = ',')

data <- melt(read.csv('inst/merged.csv'), id.vars = 'implementation')
plot <- ggplot(data, aes(x = implementation, y = value, fill = variable)) +
  geom_bar(stat = 'identity') +
  facet_wrap(~ variable)
saveWidget(ggplotly(plot), 'inst/merged.html', selfcontained = TRUE)
