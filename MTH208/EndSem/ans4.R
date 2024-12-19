library(MASS)
library(tidyverse)

# Calculating incidents per year of every ship
dat <- ships %>%
  select(type, service, incidents) %>%
  filter(service != 0) %>%
  mutate(`Incidents per Year` = (incidents / (service / 12)))

# Creating boxplot of Incidents per year v/s Type of Ship
plt <- ggplot(dat) +
  geom_boxplot(
    aes(x = type, y = `Incidents per Year`)
  ) +
  labs(
    title = "Incidents per Year of different types of Ships"
  ) +
  xlab("Type of Ship")

## This plot disproves the hypothesis.
## The ships of type B were also used for most
## number of months which had led to most number
## of accidents. Ship type E had the most number
## incidents per year.

plt
