# Data Visualization with ggplot
# Geocoding Points
# Video 4.4

library(tidyverse)
library(ggmap)

# Insert your API key below
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")

#geocode a place
chennai <- geocode("Chennai, Tamil Nadu")

chennai

#geocode a company
lyndaa <- geocode("lynda.com")

lyndaa

#using get_map and ggmap together:
#1
chennai_map <- get_map(chennai)
ggmap(chennai_map)

#2 ggmap(get_map(location)) = qmap(location)
#plots california where lynda office is located
ggmap(get_map(lyndaa))

#3 Assigning to a variable directly
whitehouse_map <- ggmap(get_map("White house"))

whitehouse_map

#setting zoom
whitehouse_map <- ggmap(get_map("White house",
                                zoom = 18))

