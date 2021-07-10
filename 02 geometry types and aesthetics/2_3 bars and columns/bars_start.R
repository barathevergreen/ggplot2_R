# Data Visualization with ggplot
# Bars and Columns
# Video 2.3

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

summary(college)

#plotting a bar graph
#bar takes count automatically in Y axes without aes specification
ggplot(data = college) +
  geom_bar(mapping = aes(x = college$region))

#plot sub categories using stacked bar
#Public and Private colleges in these regions
#this is available in column = control

#1 using color aes:
#only outline differentiated
ggplot(data = college) +
  geom_bar(mapping = aes(x = region,
                         color = control))

#2 using fill aes:
ggplot(data = college) +
  geom_bar(mapping = aes(x = region,
                         fill = control))

#Apply a result directly into ggplot using %>%
#eg.to calculate mean tuition fees in each region

college %>%
  group_by(region) %>%
  summarise(average_tuition = mean(tuition)) %>%
  ggplot() +
  geom_col(mapping = aes(x = region,
                         y = average_tuition))

