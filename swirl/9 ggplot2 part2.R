# basic components
# data frame
# aesthetic mappings
# geoms
# facets
# stats
# scale
# coordinate system

# qplot one more time
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'), facets = . ~ drv)

# basics
g <- ggplot(mpg, aes(displ, hwy))
summary(g)
g + geom_point()
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method = 'lm')
g + geom_point() + geom_smooth(method = 'lm') + facet_grid(. ~ drv)
g + geom_point() + geom_smooth(method = 'lm') + facet_grid(. ~ drv) + ggtitle('Swirl Rules!')

# modifying aesthetics
g + geom_point(color = 'pink', size = 4, alpha = 1/2)
g + geom_point(size = 4, alpha = 1/2, aes(color = drv))

# modifying labels
g + geom_point(aes(color = drv)) + labs(title = 'Swirl Rules!') + labs(x = 'Displacement', y = 'Hwy Mileage') 

# customising geom_smooth
# se points wether grey shadows indicating confidence intervals should be used
g + geom_point(aes(color = drv), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = 'lm', se = FALSE)

# changing theme
g + geom_point(aes(color = drv)) + theme_bw(base_family = 'Times')

# axis' limits. comparing base and ggplot2
plot(myx, myy, type = 'l', ylim = c(-3, 3)) # outlier is outside the box
g <- ggplot(testdat, aes(x = myx, y = myy))
g + geom_line()
g + geom_line() + ylim(-3, 3) # outlier is ignored, only a subset is plotted
g + geom_line() + coord_cartesian(ylim = c(-3, 3))# outlier is outside the box

# more complicated example
g <- ggplot(mpg, aes(x = displ, y = hwy, color = factor(year)))
g + geom_point()
g + geom_point() + facet_grid(drv ~ cyl, margin = TRUE) # include totals
g + geom_point() + facet_grid(drv ~ cyl, margin = TRUE) + geom_smooth(method = 'lm', se = FALSE, size = 2, color = 'black')
g + geom_point() + facet_grid(drv ~ cyl, margin = TRUE) + geom_smooth(method = 'lm', se = FALSE, size = 2, color = 'black') + labs(x = 'Displacement', y = 'Highway Mileage', title = 'Swirl Rules!')
