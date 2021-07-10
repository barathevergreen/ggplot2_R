# Data Visualization with ggplot
# Zooming in on California
# Video 5.4

# Load the tidyverse libraries
library(tidyverse)
library(ggmap)

# Load the college dataset
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Load state information
states <- map_data("state")

# Remove Alaska and Hawaii
college <- college %>%
  filter(state!="HI" & state!="AK")

# Plot the map
ggplot(states) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads))

# Load a map of California
california <- map_data(map="county", region="California")

# Replot the map
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads))

# Restrict the dataset to California schools
college <- college %>%
  filter(state=="CA")

# Replot the map
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads))

# Add some transparency
# Replot the map
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads), alpha=0.6)
