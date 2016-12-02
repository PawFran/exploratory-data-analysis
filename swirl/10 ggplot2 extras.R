str(diamonds)
        ### qplot ###
# histogram
qplot(price, data = diamonds)
range(diamonds$price)

qplot(price, data = diamonds, binwidth = 18497/30)

brk
counts

qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)


# histogram as density function
qplot(price, data = diamonds, geom = 'density')
qplot(price, data = diamonds, geom = 'density', color = cut)


# scatterplots
qplot(carat, price, data = diamonds)
qplot(carat, price, data = diamonds, shape = cut)
qplot(carat, price, data = diamonds, color = cut)
qplot(carat, price, data = diamonds, color = cut) + geom_smooth(method = 'lm')
qplot(carat, price, data = diamonds, color = cut, facets = . ~ cut) + geom_smooth(method = 'lm')

        ### ggplot ###
g <- ggplot(diamonds, aes(depth, price))
summary(g)
g + geom_point(alpha = 1/3)

# cutting data to receive a factor
cutpoints <- quantile(diamonds$carat, seq(0, 1, length = 4 ), na.rm = TRUE)
cutpoints
diamonds$car2 <- cut(diamonds$carat, cutpoints)
g <- ggplot(diamonds, aes(depth, price))
g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2)


diamonds[myd, ]

g + geom_point(alpha = 1/3) + facet_grid(cut ~ car2) + geom_smooth(method = 'lm', size = 3, color = 'pink')

# boxplot
ggplot(diamonds, aes(carat, price)) + geom_boxplot() + facet_grid(. ~ cut)
