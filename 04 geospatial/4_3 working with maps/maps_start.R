# Data Visualization with ggplot
# Working with Map Data
# Video 4.3

library(tidyverse)
library(ggmap)

# Insert your own API key below
#ggmap{register_google}
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")

#we can zoom in - say zoom 20 - to identify place which google uses to mark our location
#Eg. New York, NY - New York Cuty Hall
#usual zoom is 10
qmap("New York, NY", zoom = 18)

#using get map
nyc_map <- get_map("New York, NY", zoom = 10)
ggmap(nyc_map)
