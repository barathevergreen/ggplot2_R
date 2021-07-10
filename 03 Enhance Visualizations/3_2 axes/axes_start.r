# Data Visualization with ggplot
# Modifying Axes
# Video 3.2

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Create the bar graph
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank())

#Modify an axes label
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  ylab("Number of Schools") +
  xlab("Region in USA")

#Adjust the scale to fit graph better
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  ylab("Number of Schools") +
  xlab("Region in USA") +
  ylim(0, 500)

#Do not touch the starting limit
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  ylab("Number of Schools") +
  xlab("Region in USA") +
  ylim(50, 500)

