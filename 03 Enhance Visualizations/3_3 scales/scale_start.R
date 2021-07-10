# Data Visualization with ggplot
# Modifying Scales
# Video 3.3

# Load the dataset
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

#Rename X axes using Scale functions: 
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  scale_x_discrete("Region in USA") +
  scale_y_continuous("Number of Schools")

#Changing Limits - Scale
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  scale_x_discrete("Region in USA") +
  scale_y_continuous("Number of Schools", limits = c(0, 500))

#Change colours - scale_fill_manual
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background=element_blank()) +
  theme(plot.background=element_blank()) +
  scale_x_discrete("Region in USA") +
  scale_y_continuous("Number of Schools", limits = c(0, 500)) +
  scale_fill_manual(values = c("orange", "blue"))
 