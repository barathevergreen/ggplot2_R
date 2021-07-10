# Data Visualization with ggplot
# Creating a Choropleth Map
# Video 4.8

library(tidyverse)

# Load the college dataset
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))

# Load the state map data 
states <- map_data("state")

#set choropleth based on how many colleges are there in each region:
#creating summary of college dataset based on count
college_summary <- college %>%
  group_by(state) %>% 
  summarise(schools = n())

#set college_summary to adjust state names - to full state names

#convert factor to character
#setNames - inbuilt function to set values
#state.name, state.abb - US State facts and figures - state{datasets}
college_summary <- college_summary %>%
  mutate(region=as.character(setNames(str_to_lower(state.name), state.abb)[as.character(state)]))

#we can see District of colombia is left out
#we do not have it in our state dataset so we set manually
college_summary <- college_summary %>%
  mutate(region=ifelse(as.character(state)=="DC", "district of columbia",region))

#combine tibbles using merge function
#states and college_summary
#both of them have same name and same type(character)
mapdata <- merge(states, college_summary,
                 by = "region")

#check whether dataset good to go for choropleth
head(mapdata)

#plot our basic map
ggplot(data = mapdata) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group)) +
  coord_map() +
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())
 
#Choropleth map
ggplot(data = mapdata) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = schools)) +
  coord_map() +
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())

#Choropleth map - gradient - Amazing color
ggplot(data = mapdata) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = schools)) +
  coord_map() +
  theme(panel.background = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank()) +
  scale_fill_gradient(low = "beige",
                      high = "red")

