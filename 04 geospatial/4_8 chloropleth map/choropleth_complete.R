# Data Visualization with ggplot
# Creatinga Choropleth Map
# Video 4.8

library(tidyverse)

# Load the college dataset
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Load the state map data 
states <- map_data("state")

# Determine the number of colleges in every state
college_summary <- college %>%
  group_by(state) %>%
  summarize(schools=n())

# Take a look at the result
college_summary
states

# Add the full state names to the college_summary tibble
college_summary <- college_summary %>%
  mutate(region=as.character(setNames(str_to_lower(state.name), state.abb)[as.character(state)]))

# Add DC back in
college_summary <- college_summary %>%
  mutate(region=ifelse(as.character(state)=="DC", "district of columbia",region)) 

# Join the college_summary and states tibbles
mapdata <- merge(states, college_summary, by="region")

# Plot a basic map
ggplot(mapdata) +
  geom_polygon(aes(x=long,y=lat,group=group)) +
  coord_map() +
  theme(plot.background=element_blank(), panel.background = element_blank(), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank()) 

# Convert to a choropleth map by using the schools variable as the fill
ggplot(mapdata) +
  geom_polygon(aes(x=long,y=lat,group=group, fill=schools)) +
  coord_map() +
  theme(plot.background=element_blank(), panel.background = element_blank(), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank()) 

# Change the color scheme
ggplot(mapdata) +
  geom_polygon(aes(x=long,y=lat,group=group, fill=schools)) +
  coord_map() +
  theme(plot.background=element_blank(), panel.background = element_blank(), axis.title=element_blank(), axis.ticks=element_blank(), axis.text=element_blank()) +
  scale_fill_gradient(low = "beige", high = "red")
  