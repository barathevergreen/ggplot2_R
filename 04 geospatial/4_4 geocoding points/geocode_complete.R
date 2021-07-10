# Data Visualization with ggplot
# Geocoding Points
# Video 4.4

library(tidyverse)
library(ggmap)

# Insert your API key below
register_google(key="YOUR_API_KEY_HERE")

# Geocode a few locations
nyc <- geocode("New York, NY")
nyc

lynda <- geocode("Lynda.com")
lynda

whitehouse <- geocode("White House")
whitehouse

# Map those points
nyc_map <- get_map(nyc)
ggmap(nyc_map)

# You don't have to store the map, wrapping get_map with ggmap is 
# similar to qmap
ggmap(get_map(lynda))

# And you can store a map as an object
whitehouse_map <- ggmap(get_map(whitehouse))
whitehouse_map

# Add a zoom factor as well
whitehouse_map <- ggmap(get_map(whitehouse, zoom=18))
whitehouse_map
