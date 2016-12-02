# useful for plotting many plots at once

# functions
# xyplot - scatterplots
# bwplot - boxplots
# histogram
# stripplot - boxplot with points
# dotplot - dots on 'violin strings'
# splom - scatterplot matrix. like pairs in base
# levelplot, contourplot - for 'image' data

library(lattice)
library(datasets)

xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

# lattice behavior
p <- xyplot(Ozone ~ Wind, data = airquality) 
print(p)


# panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c('group 1', 'group 2'))
xyplot(y ~ x | f, layout = c(2, 1))

xyplot(y ~ x | f, panel = function(x, y, ...){
    panel.xyplot(x, y, ...) # first call default panel function fox xyplot
    panel.abline(h = median(y), lty = 2)
    panel.lmline(x, y, col = 2)
})