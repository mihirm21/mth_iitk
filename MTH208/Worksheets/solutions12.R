####################################
## Solutions for Worksheet 11
####################################
library(ggplot2)
library(tibble)

## Load the dataset
load("covid.Rdata")

names(india_covid) <- c("state", "confirmed", "active", "cured", "death")
covid <- as_tibble(india_covid)


## Create ordered barplot where the color is 
## the rate of death in the state

covid <- covid[order(covid$confirmed), ]
covid$state <- factor(covid$state, levels = covid$state)
covid$rate <- round(covid$death/covid$confirmed, 3)

g <- ggplot(covid, aes(x = state, y = log10(confirmed)))
g + geom_bar(stat = 'identity', aes(fill = rate)) + 
labs(y = "Log of Confirmed Cases", x = "State/UT", 
     title = "Covid India Data", subtitle = "Confirmed Cases shaded by rate of death") + 
coord_flip()

# Ideally, we would think that as confirmed cases increase, it affects
# the rate of death will also increase, as the hospitals become more burdened.
# However, Nagaland and Punjab have high rates of death, but reltively low
# confirmed cases. We may hypothesise that treatment may have not been done 
# sufficiently in these countries


# Same plot as above, except with text as the rate
covid <- covid[order(covid$confirmed), ]

g <- ggplot(covid, aes(x = state, y = log10(confirmed), label = rate))
g +  geom_point(stat='identity', fill="black", size=8) + 
geom_segment(aes(y = 0, x = state, yend = log10(confirmed), xend = state), color = "black") +
geom_text(color="white", size=2) + 
labs(y = "Log of Confirmed Cases", x = "State/UT", 
     title = "Covid India Data", subtitle = "Confirmed Cases with rate as text") + 
coord_flip()