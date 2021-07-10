# Data Visualization with ggplot
# Histograms
# Video 2.4

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

#plotting bar graph in a widely distributed area= eg no of undergrads in college
ggplot(data = college) +
  geom_bar(mapping = aes(x=undergrads))

#plotting the same using a histogram
ggplot(data = college) +
  geom_histogram(mapping = aes(x = undergrads))

#plot with boundary (origin attribute deprectaed): 
ggplot(data = college) +
  geom_histogram(mapping = 
                   aes(x = undergrads),
                 boundary = 0)

#plot with boundary (origin attribute deprectaed) + tweak Bins
#Here bin is the collection of data from N no of schools
#Binwidth is the direct indicator on range of data points
ggplot(data = college) +
  geom_histogram(mapping = 
                   aes(x = undergrads),
                 boundary = 0,
                 bins = 10)

#binwidth
#within each 10000 values how much is the count
ggplot(data = college) +
  geom_histogram(mapping = 
                   aes(x = undergrads),
                 boundary = 0,
                 binwidth = 10000)
