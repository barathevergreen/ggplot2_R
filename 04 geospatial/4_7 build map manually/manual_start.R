# Data Visualization with ggplot
# Creating a US Map Manually
# Video 4.7

library(tidyverse)
library("ggmap")

# Insert your own API key here
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")

#using map_data to see all the data of the map
#state contains USA data - region wise
states_data <- map_data("state")

#plot using ggplot using geom_polygon
ggplot(data = states_data, mapping = aes(x = long,
                     y = lat)) +
  geom_polygon()

#fix the distorted polygon - group aesthetic
#single group polygon covering all polygons
ggplot(data = states_data, 
       mapping = aes(x = long,
                     y = lat,
                     group = group)) +
  geom_polygon()

#uneven size - because resembles globe structure
#we can coordinate for flat surfaces using coord_map()
#install.packages("mapproj")
ggplot(data = states_data, 
       mapping = aes(x = long,
                     y = lat,
                     group = group)) +
  geom_polygon() +
  coord_map()

#adjust theme to show map promptly
ggplot(data = states_data, 
       mapping = aes(x = long,
                     y = lat,
                     group = group)) +
  geom_polygon() +
  coord_map() +
  theme(panel.background = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank())



