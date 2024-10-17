#                     Longest Collatz sequence
#
# The  following  iterative  sequence  is  defined  for  the  set  of positive
# integers:
#
#                         n → n/2 (n is even)
#                         n → 3n + 1 (n is odd)
#
# Using  the  rule  above  and  starting  with  13,  we generate the following
# sequence:
#
#             13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It  can  be  seen  that  this  sequence  (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
#                             Answer: 837799
#

collatzSequenceRecursive <- function(element) {
  sequence <- c(element)

  if (1 == element) {
    return (1)
  }

  if (0 == element %% 2) {
    return (c(sequence, collatzSequenceRecursive(element/2)))
  }

  return (c(sequence, collatzSequenceRecursive((3 * element) + 1)))
}

collatzSequenceLoop <- function(element) {
  sequence <- c(element)
  index <- element

  while (1 != index) {
    index <- if (0 == index %% 2) index/2 else (3 * index) + 1

    sequence <- c(sequence, index)
  }

  return (sequence)
}

collatzSequenceMemoization <- memoise::memoise(collatzSequenceRecursive)

answerSkeleton <- function(limit, toApply) {
  index <- 1
  largestSequenceNumber <- 0
  largestSequenceSize <- 0

  while(index <= limit) {
    currentSequenceSize <- length(toApply(index))

    if (currentSequenceSize > largestSequenceSize) {
      largestSequenceNumber <- index
      largestSequenceSize <- currentSequenceSize
    }

    index <- index + 1
  }

  return (largestSequenceNumber)
}

simpleAnswer <- function(limit) answerSkeleton(limit, collatzSequenceRecursive)

elaborateAnswer <- function(limit) answerSkeleton(limit, collatzSequenceLoop)

memoizationAnswer <- function(limit) answerSkeleton(limit, collatzSequenceMemoization)

parallelAnswer <- function(limit) {
  library(doParallel)

  nCores <- detectCores() / 2
  cluster <- makeCluster(nCores)
  registerDoParallel(cluster)

  load <- floor(limit / nCores)
  largestSequence <- list()
  calc <- function(limit) {
    counter <- 1
    element <- limit

    while (1 != element) {
      element <- if (0 == element %% 2) element/2 else (3 * element) + 1
      counter <- counter + 1
    }

    return (counter)
  }
  collatzCounter <- function(start, end) {
    end <- index * load
    index <- start
    largestSequenceNumber <- 0
    largestSequenceSize <- 0

    while (index <= end) {
      currentSequenceSize <- calc(index)

      if (currentSequenceSize > largestSequenceSize) {
        largestSequenceNumber <- index
        largestSequenceSize <- currentSequenceSize
      }

      index <- index + 1
    }

    return (c(largestSequenceNumber, largestSequenceSize))
  }

  largestSequence <- foreach(index = 1:nCores, .export = ls(globalenv())) %dopar% {
    start <- ((index - 1) * load) + 1
    end <- index * load

    largestSequence[end] <- collatzCounter(start, end)
  }

  stopCluster(cl = cluster)

  lastOne <- nCores * load

  # Handle the remaining load
  if (lastOne < limit) {
    largestSequence[[index]] <- collatzCounter(index, limit)
  }

  maxSequenceSize <- 0
  maxSequenceNumber <- 0

  for (item in largestSequence) {
    if (item[2] > maxSequenceSize) {
      maxSequenceSize <- item[2]
      maxSequenceNumber <- item[1]
    }
  }

  return (maxSequenceNumber)
}

problem14 <- function(limit) {
  if (limit < 100) {
    return (simpleAnswer(limit))
  }
  if (limit < 1000) {
    return (elaborateAnswer(limit))
  }
  if (limit < 10000) {
    return (memoizationAnswer(limit))
  }

  return (parallelAnswer(limit))
}
