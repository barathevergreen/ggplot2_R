# Data Visualization with ggplot
# Plotting Points on a Map
# Video 4.6

library(tidyverse)
library(ggmap)

# Insert your own API key here
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")

# Geocode a few locations
nyc <- geocode("New York, NY")
usa <- geocode("United States")

#plot nyc using geom+_point
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = nyc)

#to plot multiple points at once
#create a tibble of places and plot them

#create a vector of places

placenames <- c("New York, NY", "White house", "Lynda.com", "Las Vegas", "The Alamo")

location <- geocode(placenames)

location_tibble <- tibble(name = placenames,
                          lat = location$lat,
                          lon = location$lon)
#plotting
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = location_tibble)

#Adding Labels to names
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = location_tibble) +
  geom_text(mapping = aes(x=lon,
                          y=lat,
                          label=name),
            color = "red",
            data = location_tibble)

#Adjusting position of labels using geom_text(nudge=)
ggmap(get_map(usa, zoom=4)) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = location_tibble) +
  geom_text(mapping = aes(x=lon,
                          y=lat,
                          label=name),
            color = "red",
            data = location_tibble,
            nudge_y = 1.25)

#much more readable version - toner-background
ggmap(get_map(usa, zoom=4, maptype = "toner-background")) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = location_tibble) +
  geom_text(mapping = aes(x=lon,
                          y=lat,
                          label=name),
            color = "red",
            data = location_tibble,
            nudge_y = 1.25)

#much more readable version - watercolor
ggmap(get_map(usa, zoom=4, maptype = "watercolor")) +
  geom_point(mapping = aes(x= lon, 
                           y = lat),color = "red", data = location_tibble) +
  geom_text(mapping = aes(x=lon,
                          y=lat,
                          label=name),
            color = "red",
            data = location_tibble,
            nudge_y = 1.25)

