set.seed(17)
runs <- 10000
n <- 15
match <- rep(NA, runs)


for (i in 1:runs){
  ids = 1:n
  shuffle = sample(ids, n, replace = FALSE)
  match[i] = sum(ids == shuffle)
}
table(match)


probmatch1plus <- sum(match>0)/runs
probmatch1plus
