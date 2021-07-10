# Data Visualization with ggplot
# Scatterplots
# Video 2.1

# Load the dataset as described in Video 1.3

library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

summary(college)

#create ggplot - DGAS 
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, 
                         y=sat_avg))

 
#check public or private from control column
#1 shape aesthetic
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, 
                         y=sat_avg,
                         shape = control))

#2 color aesthetic
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, 
                         y=sat_avg,
                         color = control))
#Learnings: 
#private school have more tuition than public
#when sat increases, tuition seem to increase as well

#3 color and size
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, 
                         y=sat_avg,
                         color = control,
                         size = college$undergrads))

#all points are solid, transparency helps to see through:

#4 alpha

ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, 
                         y=sat_avg,
                         color = control,
                         size = college$undergrads), alpha = 0.5)
