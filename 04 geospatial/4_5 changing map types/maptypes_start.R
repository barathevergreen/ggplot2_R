# Data Visualization with ggplot
# Changing Map Types
# Video 4.5

library(tidyverse)
library(ggmap)

# Insert your own API key here
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")

# Pull up a map of New York City again
#default terrain map
nyc <- geocode("New York, NY")
ggmap(get_map(nyc))

#road map
#ggmap{get_map(maptype=)}
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "roadmap"))


#only labels in terrain
#Without features but only names and labels
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "terrain-labels"))


#Only the outlines and no labels
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "terrain-lines"))


#birds eye view - satellite view
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "satellite"))


#Hybrid - satellite + labels
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "hybrid"))


  #toner - suited for printing in black and white
  nyc <- geocode("New York, NY")
  ggmap(get_map(nyc,maptype = "toner"))
  
#light version - amazing
nyc <- geocode("New York, NY")
ggmap(get_map(nyc,maptype = "toner-lite"))

#nice artistic - water colour
nyc <- geocode("New York, NY")
ggmap(get_map(nyc, maptype = "watercolor"))
  
