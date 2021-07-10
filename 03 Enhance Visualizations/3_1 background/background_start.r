# Data Visualization with ggplot
# Modifying the Background
# Video 3.1

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Create the bar graph from Video 2.3
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control))

#add a theme - plot and panel background
#plot.background
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(plot.background = element_rect(fill = "purple"))

#panel.background
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background = element_rect(fill = "purple"))

#no background
#here the gridlines are also white
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background = element_blank())

#incase we need gridllines
#both x and y axes
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background = element_blank()) +
  theme(panel.grid.major = element_line(color = "grey"))

#say we need only Y axes
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme(panel.background = element_blank()) +
  theme(panel.grid.major.y = element_line(color = "grey"))
