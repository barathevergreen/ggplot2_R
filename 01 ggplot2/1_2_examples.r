# Code used to create charts for 1.2 Grammar of Graphics
# Not for distribution to students

library(tidyverse)
baseball <- read_csv("/Users/mchapple/Desktop/baseball.csv")

baseball <- baseball %>%
  gather(year, wins, -Team) %>%
  rename(team=Team)

baseball$year <- as.integer(baseball$year)
baseball$team <- as.factor(baseball$team)

ggplot(data=baseball, mapping=aes(x=year, y=wins)) +
  geom_point()

ggplot(data=baseball, mapping=aes(x=year, y=wins)) +
  geom_point(mapping=aes(shape=team))

ggplot(data=baseball, mapping=aes(x=year, y=wins)) +
  geom_point(mapping=aes(color=team))

ggplot(data=baseball, mapping=aes(x=year, y=wins)) +
  geom_line(mapping=aes(color=team))

baseball %>%
  filter(team=='New York Mets' | team=='New York Yankees') %>%
  ggplot(mapping=aes(x=year, y=wins)) +
  geom_line(mapping=aes(color=team))

baseball %>%
  filter(team=='New York Mets' | team=='New York Yankees') %>%
  ggplot(mapping=aes(x=year, y=wins)) +
  geom_col(mapping=aes(fill=team), position="dodge") +
  coord_cartesian(ylim=c(60,105))
