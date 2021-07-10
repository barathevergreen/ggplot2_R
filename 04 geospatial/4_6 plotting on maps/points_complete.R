# Data Visualization with ggplot
# Plotting Points on a Map
# Video 4.6

library(tidyverse)
library(ggmap)

# Insert your own API key here
register_google(key="YOUR_API_KEY_HERE")

# Geocode a few locations
nyc <- geocode("New York, NY")
usa <- geocode("United States")

# Call up a map of the United States
ggmap(get_map(usa))
ggmap(get_map(usa, zoom=4))

# Plot a point on the map
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=nyc)

# Create a tibble of locations
placenames <- c("New York, NY", "White House", "Lynda.com", "Mt. Rushmore", "The Alamo")
locations <- geocode(placenames)
places <- tibble(name=placenames, lat=locations$lat, lon=locations$lon)

# Plot the locations on the map
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=places)

# Add their names using the text geometry
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=places) +
  geom_text(mapping=aes(x=lon, y=lat, label=name), color="red", data=places)

# Adjust the label position
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=places) +
  geom_text(mapping=aes(x=lon, y=lat, label=name), color="red", nudge_y=1, data=places)

# Try a simpler map
ggmap(get_map(usa, zoom=4, maptype = "toner-background")) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=places) +
  geom_text(mapping=aes(x=lon, y=lat, label=name), color="red", nudge_y=1, data=places)

# Make a restaurant placemat
ggmap(get_map(usa, zoom=4, maptype="watercolor")) +
  geom_point(mapping=aes(x=lon, y=lat), color="red",data=places) +
  geom_text(mapping=aes(x=lon, y=lat, label=name), color="red", nudge_y=1, data=places)

