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


# Suppose a researcher is planning to study the spread of a skin fungus among a population of 100 
# penguins by repeatedly checking animals’ skin for evidence of infection of the course of a year. 
# However, he cannot afford to check the entire population’s skin at each time point. 
# Instead, he can examine 10 tagged animals at each time point. If the researcher randomly selects 
# 35 animals from the population and tags them, he wants to know the probability that he will obtain 
# 10 tagged animals in a subsequent sample if he randomly selects 25 animals from the population. 
# 
# Use a simulation study based on 10,000 runs to estimate this probability. 



set.seed(19)

runs <- 10000
n <- 100
n1 <- 35
n2 <- 25
n3 <- 10
matches <- rep(NA, runs)

for (i in 1:runs){
  pengs = 1:n
  samps1 = sample(pengs, n1, replace = FALSE)
  samps2 = sample(pengs, n2, replace = FALSE)
  matches[i] = sum(samps1 %in% samps2)
}

table(matches)

prob10tag <- sum(matches == 10) / runs
prob10tag
