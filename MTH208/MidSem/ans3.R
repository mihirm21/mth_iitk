library(tibble)
library(tidyverse)

# Read the titanic data from the csv file
titanic.data <- as_tibble(read_csv("titanic.csv"))

# Convert the Survived column into a factor having the values "Died" and "Survived"
titanic.data$Survived <- factor(titanic.data$Survived)
levels(titanic.data$Survived) <- c("Died", "Survived")

# The final graph
finalP <- ggplot(titanic.data, aes(x = Survived, y = Fare)) +
  geom_boxplot(aes(color = Sex)) +
  labs(title = "Fare vs Survival",
       subtitle = "Irrespective of Sex, richer people survived",
       x = "",
       y = "Fare"
  ) +
  coord_flip()
