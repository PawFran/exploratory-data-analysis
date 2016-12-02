# q7 
# examining how the relationship between ozone and wind speed varies across each month. 
# What would be the appropriate code to visualize that using ggplot2? 
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month)) # doesn't work

# q9
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)

# q10
qplot(votes, rating, data = movies) + geom_smooth()
