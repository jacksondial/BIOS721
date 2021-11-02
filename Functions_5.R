#Functions notes

x <- 1:40
myfun <- function(x){
  results <- c()
  sum_dat <- sum(x)
  for (i in 1:length(i)){
    results[i] <- x[i]/sum_dat
  }
  return(results)
}
myfun(x)



rm(list=ls())
?gc()

setwd()
source('myfunction.R')


setwd()
source('my_functions.R')
#then can use the functions in the file there

