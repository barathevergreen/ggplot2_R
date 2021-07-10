# Data Visualization with ggplot
# Annotating Plots
# Video 3.5

# Load the dataset as described in Video 1.3
library(tidyverse)
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Create the scatterplot from Video 2.1
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2)

  # Add annotate - eg. elite privates
  ggplot(data=college) +
    geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
    annotate("text",
             label = "Elite Privates",
             x = 45000,
             y = 1450)

# Add an indicator line sat_avg of all schools
#at 1000 sat avg score
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = 1000)


#we can draw this line at the mean of the score
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = mean(college$sat_avg)) 

#add an annotation to mean(score)
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text",
           label= "Mean SAT Score",
           x = 45000,
           y = mean(college$sat_avg)+25 )

#add vertical line - geom_vline()
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text",
           label= "Mean SAT Score",
           x = 45000,
           y = mean(college$sat_avg)-25 ) +
  geom_vline(xintercept = mean(college$tuition)) +
  annotate("text", 
           label = "Mean Tuition Fees",
           x = mean(college$tuition)+8000,
           y = 700)

#using theme and legend tweaks
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text",
           label= "Mean SAT Score",
           x = 45000,
           y = mean(college$sat_avg)-25 ) +
  geom_vline(xintercept = mean(college$tuition)) +
  annotate("text", 
           label = "Mean Tuition Fees",
           x = mean(college$tuition)+8000,
           y = 700) + 
theme(panel.background = element_blank(),
      legend.key = element_blank())

#Updating X and Y axes names
#Legend display names
#we can take them from geom_point
ggplot(data=college) +
  geom_point(mapping=aes(x=tuition, y=sat_avg, color=control, size=undergrads), alpha=1/2) +
  annotate("text",
           label = "Elite Privates",
           x = 45000,
           y = 1450) +
  geom_hline(yintercept = mean(college$sat_avg)) +
  annotate("text",
           label= "Mean SAT Score",
           x = 45000,
           y = mean(college$sat_avg)-25 ) +
  geom_vline(xintercept = mean(college$tuition)) +
  annotate("text", 
           label = "Mean Tuition Fees",
           x = mean(college$tuition)+8000,
           y = 700) + 
  theme(panel.background = element_blank(),
        legend.key = element_blank()) +
  scale_x_discrete("Tuition Fees") +
  scale_y_continuous("Average Score")+
  scale_color_discrete("Instituition Type") +
  scale_size_continuous("No of Undergrads")
  