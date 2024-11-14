#                             Names scores
#
# Using  problem_22.txt,  a  46K text file containing over five-thousand first
# names,  begin  by  sorting  it into alphabetical order. Then working out the
# alphabetical  value  for  each name, multiply this value by its alphabetical
# position in the list to obtain a name score.
#
# For  example,  when the list is sorted into alphabetical order, COLIN, which
# is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?
#
#                         Answer: 871198282

nameWeight <- function(item) {
  line <- as.integer(item[['index']])
  name <- item[[2]]
  splitName <- unlist(strsplit(tolower(name), ''))
  values <- as.integer(paste(unlist(Map(function(cur) which(letters == cur), splitName))))

  return (sum(values) * line)
}

#'
#' @export
#'
problem22 <- function(filepath) {
  data <- readLines(filepath)
  quotedNames <- strsplit(data, ',')[[1]]
  upperNames <- sort(gsub('\"', '', quotedNames))

  return (Reduce(function(acc, cur) acc + nameWeight(cur), enumerate(upperNames), 0))
}