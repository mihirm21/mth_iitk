################################
## Solutions to Worksheet 7
################################
library(rvest)

###### Question 1
# loading html
html <- read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")
# names are in head2 class
name <- html %>% html_elements(".head2") %>% html_text()


###### Question 2
html <- read_html("https://www.imdb.com/chart/top/")

# getting a tag in titlecolumn class and the text in there
name <- html %>%  
  html_elements(".titleColumn a") %>% 
  html_text()

###### Question 2
# name is done, getting year
year <- html %>% 
  html_elements(".secondaryInfo") %>% 
  html_text() %>%
  substring(2,5) %>%  # removing brackets
  as.numeric()  # changing to number

# getting rating
rating <-  html %>% 
  html_elements(".ratingColumn.imdbRating") %>% 
  html_elements("strong") %>% 
  html_text() %>%
  as.numeric()  # convering to numeric

votes <- html %>% 
  html_elements(".ratingColumn strong") %>%
  html_attr("title") %>%
  substring(14) # removing the first 13 characters


# making dataset
dat <- data.frame(name, year, rating, votes)


