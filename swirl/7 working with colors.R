library(swirl)
swirl()

sample(colors(), 10)

# colorRamp
pal <- colorRamp(c('red', 'blue')) # what about more than two colors ?
pal(0)
pal(1)
pal(seq(0, 1, len = 6))

#colorRampPalette
p1 <- colorRampPalette(c('red', 'blue'))
p1(2)
p1(6) 
0xcc

p2 <- colorRampPalette(c('red', 'yellow'))
p2(2)
p2(10)

# ...copied some code from the R documentation pages (color.scale if you're interested)...
showMe(p1(20))
showMe(p2(20))
showMe(p2(2))

# 4th parameter to colorRamp
p1
?rgb
p3 <- colorRampPalette(c('blue', 'green'), alpha = .5)
p3(5)

plot(x, y, pch = 19, col = rgb(0, 0.5, 0.5))
plot(x, y, pch = 19, col = rgb(0, 0.5, 0.5, 0.3))

# RColorBrewer
cols <- brewer.pal(3, 'BuGn')
showMe(cols)
pal <- colorRampPalette(cols)
showMe(pal(20))
image(volcano, col = pal(20))
image(volcano, col = p1(20))
