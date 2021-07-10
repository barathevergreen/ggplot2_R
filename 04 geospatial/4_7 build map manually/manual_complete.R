# Data Visualization with ggplot
# Creating a US Map Manually
# Video 4.7

library(tidyverse)

# Insert your own API key here
register_google(key="YOUR_API_KEY_HERE")

# Load the state map data 
states <- map_data("state")

# Inspect the state data
states

# Plot the state data
ggplot(data=states, mapping=aes(x=long, y=lat)) +
  geom_polygon()

# Add the group aesthetic
ggplot(data=states, mapping=aes(x=long, y=lat, group=group)) +
  geom_polygon()

# Fix the coordinate system
ggplot(data=states, mapping=aes(x=long, y=lat, group=group)) +
  geom_polygon() +
  coord_map()

# Remove the background
ggplot(data=states, mapping=aes(x=long, y=lat, group=group)) +
  geom_polygon() +
  coord_map() +
  theme(axis.ticks=element_blank(), axis.text=element_blank(), axis.title=element_blank()) +
  theme(panel.background=element_blank())
