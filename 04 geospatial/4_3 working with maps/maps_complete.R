# Data Visualization with ggplot
# Working with Map Data
# Video 4.3

library(tidyverse)
library(ggmap)

# Insert your own API key below
register_google(key="YOUR_API_KEY_HERE")

# Use quick map to look at a city map
qmap("New York, NY", zoom=10)

# Zoom in and out
qmap("New York, NY", zoom=15)
qmap("New York, NY", zoom=18)
qmap("New York, NY", zoom=7)
qmap("New York, NY", zoom=10)

# Get the same map with get_map
nyc_map <- get_map("New York, NY", zoom=10)

# And plot it
ggmap(nyc_map)
