        ### qplot ###
str(mpg)
# scatterplots
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, color = drv, geom = c('point', 'smooth')) 

# plot values of y in order they appear in data
qplot(y = hwy, data = mpg, color = drv)
myhigh

# box - whiskers plots
qplot(drv, hwy, data = mpg, geom = 'boxplot')
qplot(drv, hwy, data = mpg, geom = 'boxplot', color = manufacturer)

# histograms
qplot(hwy, data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = . ~ drv) # facets: rows ~ columns ('.' means one)
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)
