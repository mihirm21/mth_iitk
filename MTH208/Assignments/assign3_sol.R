
library(rvest)
html <- read_html("https://www.icc-cricket.com/rankings/womens/player-rankings/odi/batting")

# Get the whole data as a table
# First element in the list
tab <- html_table(html)[[1]]

# Replace first column with 1:100
tab$Pos <- 1:100

# Remove last column
tab <- tab[, -5]

# convert to data.frame
# this step is not very necessary
MY_icc_rank <- as.data.frame(tab) 

