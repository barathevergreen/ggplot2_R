# Data Visualization with ggplot
# Boxplots
# Video 2.5

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

#scatterplot - control(public,private) vs tuition fees
ggplot(data = college) +
  geom_point(mapping= aes(x = control,
                          y = tuition))

#to spread the points we can use jitter plot
#better clarity
ggplot(data = college) +
  geom_jitter(mapping = aes(x = control,
                            y = tuition))

#Plotting a box plot
ggplot(data = college) +
  geom_boxplot(mapping = aes(x = control,
                             y = tuition))
