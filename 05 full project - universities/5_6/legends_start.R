# Data Visualization with ggplot
# Clean the Legends
# Video 5.6

# Load the tidyverse libraries
library(tidyverse)
library(ggmap)

# Load the college dataset
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

#map data of states
states <- map_data("state")

# Plot a basic US map
ggplot(states) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, mapping = aes(x = lon,
                                           y = lat))

#adjusting data to remove Alaska and Hawaii
college <- college %>%
  filter(state!="AK" & state!= "HI")


#set color for private and public
ggplot(states) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control))

#size of each points based on undergrads
ggplot(states) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control,
                           size = undergrads),
                           alpha = 0.5)

california <- map_data(map = "county",
                       region = "california")

#plotting only for california
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control,
                           size = undergrads,
                           alpha = 0.5))

#adjusting data to set for california
college <- college %>%
  filter(state == "CA")

#plotting only for california with california data
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control,
                           size = undergrads),
             alpha = 0.5)

#Label the Major cities in the map

#create a tibble with city names and plot them
#create a vector of strings of cities
city_names <- c("Los Angeles", "San Diego", "San Francisco", "San Jose", "Fresno", "Sacramento")

# Insert your own API key below
#ggmap{register_google}
register_google(key="AIzaSyAAamrUEY2p8COurYmoH-ZFCgujiq7-xHA")


#create lat and lon using geocode
locations <- geocode(city_names)

#apply in tibble
cities <- tibble(name = city_names, 
                 lat = locations$lat,
                 lon = locations$lon)

#plot the tibble
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control,
                           size = undergrads),
                           alpha = 0.5) +
  geom_text(data = cities, mapping = aes(x = lon,
                                         y = lat,
                                         label = name))

#tidy up legends and add title
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data = college, 
             mapping = aes(x = lon,
                           y = lat,
                           color = control,
                           size = undergrads
                           ), alpha = 0.5) +
  geom_text(data = cities, mapping = aes(x = lon,
                                         y = lat,
                                         label = name)) +
  scale_size_continuous(name = "Undergraduate Count") +
  scale_color_discrete(name = "Instituition Type") +
  theme(legend.key = element_blank()) +
  ggtitle("California Educational Institutes located near large cities:", subtitle = "Source: US Dept of Education")

