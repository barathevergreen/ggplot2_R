library(tidyverse)

#college location dataset from online server
#interesting use of read_csv
college <-read_csv("http://672258.youcanlearnit.net/college.csv")

college %>% view()

#summary function will give a good idea of each column based on the values
summary(college)

#check value - Numeric columns that are taken as character
unique(college$loan_default_rate)

#convert to factors - significant non numeric datasets:
colnames(college)

#state region highest degree control

#using dplyr{mutate}

college <- college %>%
  mutate(state = as.factor(state),
         region = as.factor(region),
         highest_degree = as.factor(highest_degree),
         control = as.factor(control),
         gender = as.factor(gender))

summary(college)

