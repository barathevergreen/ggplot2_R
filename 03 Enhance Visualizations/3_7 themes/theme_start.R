# Data Visualization with ggplot
# Themes
# Video 3.7

# Load the dataset as described in Video 1.3
library(tidyverse)
library("ggthemes")

college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Create the bar graph from Video 2.3
#default ggplot theme
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control))

#We can change to new theme
#black and white
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_bw()

#minimal
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_minimal()

#void - very minimal
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_void()

#dark
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_dark()

#install ggthemes
#try solarized theme
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_solarized()

#excel
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_excel()

#wsj
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_wsj()

#economist
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_economist()

#fivethirtyeight
ggplot(data=college) +
  geom_bar(mapping=aes(x=region, fill=control)) +
  theme_fivethirtyeight()
