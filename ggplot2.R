            ### qplot ###

# qplot always looks for data frame
# factors indicating subsets should be labeled
library(ggplot2)
str(mpg)

# scatterplot
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'))

# histogram
qplot(hwy, data = mpg, fill = drv)

# facets
# variable on the right-hand side specifies columns
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)


            ### basic components of ggplot2 plot ###
# data frame
# aestetic mappings - how data are mapped to color, size
# geoms - objects like points, lines, shapes
# facets - for conditional plotting
# stats - statistical transformations
# scales - what scale aestetic maps uses
# coordinate system

            ### axis limits ###
# base
test_data <- data.frame(x = 1:100, y = rnorm(100))
test_data[50, 2] <- 100 # outlier
plot(test_data$x, test_data$y, type = 'l', ylim = c(-3, 3))

# ggplot
g <- ggplot(test_data, aes(x = x, y = y))
g + geom_line()
g + geom_line() + ylim(-3, 3) # exludes outliers! creates a subset
g + geom_line() + coord_cartesian(ylim = c(-3, 3)) # outliers included
