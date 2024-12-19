library(rvest)

html <- read_html("https://prsindia.org/covid-19/cases")

foo <- html %>% html_table()
foo <- foo[[1]]

MY_india_rates <- foo[-1, ]
MY_india_rates <- MY_india_rates[ ,-1]
MY_india_rates <- as.data.frame(MY_india_rates)

save(MY_india_rates, file = "covid.Rdata")

