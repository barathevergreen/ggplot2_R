# Data Visualization with ggplot
# Adding City Names
# Video 5.5

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

# Load a map of California
california <- map_data(map="county", region="California")

# Restrict the dataset to California schools
college <- college %>%
  filter(state=="CA")

# Plot the map
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads), alpha=0.6)

# Create a tibble of city names and locations
city_names <- c("Los Angeles", "San Diego", "San Jose", "San Francisco", "Fresno", "Sacramento")
locations <- geocode(city_names)
cities <- tibble (name=city_names, lat=locations$lat, lon=locations$lon)

# Label the cities
ggplot(california) +
  geom_polygon(mapping=aes(x=long,y=lat,group=group), color="grey", fill="beige") +
  coord_map() +
  theme(plot.background=element_blank(), 
        panel.background = element_blank(), 
        axis.title=element_blank(), 
        axis.ticks=element_blank(), 
        axis.text=element_blank()) +
  geom_point(data=college, mapping=aes(x=lon, y=lat, color=control, size=undergrads), alpha=0.6) +
  geom_text(data=cities, mapping=aes(x=lon, y=lat, label=name))

