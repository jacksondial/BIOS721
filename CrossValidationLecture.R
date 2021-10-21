#Cross Validation Lecture

library(readr)
library(tidyverse)
library(pROC)
#setwd("C:/Users/jacks/OneDrive/Desktop/DUKE_FALL2021/721/BIOSTAT721")
dat <- read_csv("Data/miniCrossVal.csv")

set.seed(1826)
test.ID = sample(dat$ID, size = ceiling(.2*(nrow(dat))), replace = FALSE)

test <- dat %>% filter(ID %in% test.ID)
train <- dat %>% filter(!(ID %in% test.ID))

fitTrain <- glm(result ~ age2 + factor(sex) + factor(chronic_disease_binary) + 
                  factor(travel_history), family = binomial(link = "logit"), data = train)

yPreds <- predict(fitTrain, newdata = test, type = "response")

auc(roc(test$result, yPreds))

#k-fold cross-validation

k = 10
j = ceiling((1/k)*nrow(dat))

r.ID = sample(dat$ID)
samp = split(r.ID, ceiling(seq_along(r.ID)/j))

AUC = rep(NA, k)
library(tictoc)

tic()

for (i in 1:k){
  test <- dat %>% filter(ID %in% unlist(samp[i]))
  train <- dat %>% filter(!(ID %in% unlist(samp[i])))
  
  fit <- glm(result ~ age2 + factor(sex) + factor(chronic_disease_binary) +
               factor(travel_history), family = binomial(link = "logit"), data = train)
  ypred = predict(fit, newdata = test, type = "response")
  
  AUC[i] = auc(roc(test$result, ypred))
}

toc()

mean(AUC)
