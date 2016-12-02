library(grDevices)
# colorRamp
pal <- colorRamp(c('red', 'blue'))
pal(0) # red, green, blue
pal(1)
pal(.5)
pal(seq(0, 1, len = 10))

# colorRampPalette
pal <- colorRampPalette(c('red', 'yellow'))
pal(2)
pal(10)


# RColorBrewer package - for choosing palette's
library(RColorBrewer)
brewer.pal.info
?brewer.pal
cols <- brewer.pal(3, 'BuGn')
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))


# smoothScatter - for lots of different points
x <- rnorm(1000)
y <- rnorm(1000)
smoothScatter(x, y) # 2D histogram

# scatterplots with transparency
plot(x, y, pch = 19)
plot(x, y, col = rgb(0, 0, 0, 0.2), pch = 19)
