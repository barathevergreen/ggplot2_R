# Data Visualization with ggplot
# Lines and Smoothers
# Video 2.2

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# We had a nice plot of tuition vs. SAT scores when we worked with scatterplots
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control))

#create a line plor from this scatterplot:
ggplot(data=college) +
  geom_line(mapping=aes(x=tuition, y=sat_avg, color=control))

#add points back to the line graph by using a second geometry
ggplot(data=college) +
  geom_line(mapping=aes(x=tuition, y=sat_avg, color=control)) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control))

#specify dataset in the plot to apply to entire plot than to a particular geometry:
ggplot(data=college, 
       mapping=aes(x=tuition, 
                   y=sat_avg, 
                   color=control)) + 
         geom_line() +
         geom_point()

#geom_smooth()
ggplot(data=college, 
       mapping=aes(x=tuition, 
                   y=sat_avg, 
                   color=control)) + 
  geom_smooth() +
  geom_point()

#Set Transparency - As the smooth line is not clear- only in point
#adjust alpha to get clear picture
ggplot(data=college, 
       mapping=aes(x=tuition, 
                   y=sat_avg, 
                   color=control)) + 
  geom_smooth() +
  geom_point(alpha = 1/25)

#To remove gray area(standard error), we can add the standard error to remove it
#this applies only to smooth so we apply only for it

ggplot(data=college, 
       mapping=aes(x=tuition, 
                   y=sat_avg, 
                   color=control)) + 
  geom_smooth(se = FALSE) +
  geom_point(alpha = 1/25)


