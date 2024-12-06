####################################
## Solutions for Worksheet 11
####################################

## Problem 1
# set your working repository correctly
load("IMDB_movies.Rdata")
head(dat)  # data is called dat

## Problem 2
hist(dat$rating, main = "Histrogram of movie ratings",
     xlab = "Ratings")
hist(dat$rating, main = "Histrogram of movie ratings",
     xlab = "Ratings", col = "white")

## Problem 3
boxplot(dat$rating, main = "Boxplot of Ratings")
boxplot(dat$rating, main = "Boxplot of Ratings", col = "pink")

## Problem 4
boxplot(dat$men_rating, dat$women_rating, 
        names = c("Men", "Women"),
        main = "Boxplot of ratings by gender")

## Problem 5
hist(dat$men_rating, main = "Hitogram of Ratings", 
     xlab = "Ratings", xlim = range(c(dat$men_rating, dat$women_rating)),
     col = adjustcolor("blue", alpha.f = .5))
hist(dat$women_rating, col = adjustcolor("red", alpha.f = .5), xlab = "Ratings", 
     add = TRUE)
legend("topright", c("Men", "Women"), 
       fill = c(adjustcolor("blue", alpha.f = .5), 
                adjustcolor("red", alpha.f = .5)))

## Problem 6
plot(dat$over.votes, dat$rating,
     xlab = "# Votes", ylab = "Ratings")
# another one with different dots
plot(dat$over.votes, dat$rating,
     xlab = "# Votes", ylab = "Ratings", pch = 16)

## Problem 7
ind <- dat$rating > 8.9
# adding text to the lst plot
text(dat$over.votes[ind], dat$rating[ind],
     labels = dat$name[ind])

## Problem 8
year.categ <- (dat$year < 1996) + 1  # 2 or 1 based on before 96 or not
plot(dat$over.votes, dat$rating,
     xlab = "# Votes", ylab = "Ratings", 
     pch = 16, col = year.categ)  # col = number based on year category
legend("topright", pch = 16, col = c(2,1),
       legend = c("before 1996", "after 1996"))

## Problem 9
plot(dat$year, dat$over.votes, ylab = "# votes", xlab = "Year")
# we see that for movies with highest number of votes, the ratings are
# high. Also, from the above plot we see that older movies 
# naturally don't have a lot of votes
# there is some response bias naturally then, in that when someone
# likes a movie a lot, they are more compelled to vote


## Problem 10
# type = "n" makes an empty plot with the right axes
plot(dat$over.votes, dat$rating,
     xlab = "# Votes", ylab = "Ratings", 
     pch = 16, col = year.categ, type = "n") 
for(i in 1:length(dat$rating))
{
  # gives a .1 second pause before running the next line
  Sys.sleep(.1)  
  
  # plot the ith point
  points(dat$over.votes[i], dat$rating[i],
         pch = 16, col = year.categ[i])
}
