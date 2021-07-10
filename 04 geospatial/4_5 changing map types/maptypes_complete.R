# Data Visualization with ggplot
# Changing Map Types
# Video 4.5

library(tidyverse)
library(ggmap)

# Insert your own API key here
register_google(key="YOUR_API_KEY_HERE")

# Pull up a map of New York City again
nyc <- geocode("New York, NY")
ggmap(get_map(nyc))

# Experiment with different map types
ggmap(get_map(nyc, maptype = "terrain"))
ggmap(get_map(nyc, maptype = "roadmap"))
ggmap(get_map(nyc, maptype = "terrain-labels"))
ggmap(get_map(nyc, maptype = "terrain-lines"))
ggmap(get_map(nyc, maptype = "satellite"))
ggmap(get_map(nyc, maptype = "hybrid"))
ggmap(get_map(nyc, maptype = "toner"))
ggmap(get_map(nyc, maptype = "toner-lite"))
ggmap(get_map(nyc, maptype = "toner-background"))
ggmap(get_map(nyc, maptype = "watercolor"))
