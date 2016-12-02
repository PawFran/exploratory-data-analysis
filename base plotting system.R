library(datasets)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = 'Month', ylab = 'Ozone (ppb)')

        # important parameters
# pch - plotting symbol
# lty - line type
# lwd - line width
# col - plotting color. colors() gives list
# xlab - x-axis label
# ylab

        # important global parameters for par()
# las - orientation of the axis label
# bg - background color
# mar - margin size
# oma - outer margin size
# mfrow - number of plots per row, column (filled row-wise)
# mfcol - number of plots per row, column (filled column-wise)

# defaults
par('lty')
par('col')
par('pch')
par('bg')
par('mar') # bottom and clockwise
par('mfrow')



# base plotting functions
# plot - make a scatterplot
# lines - add lines. may also connect dots
# points - add points
# text - add labels
# title - add annotations outside plot
# mtext - add text to the margins
# axis - add axis ticks/labels

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = 'blue'))

with(airquality, plot(Wind, Ozone, main = 'Wind and Ozone in New York City', type = 'n'))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = 'blue'))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = 'red'))
legend('topright', pch = 1, col = c('blue', 'red'), legend = c('May', 'Other months'))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New Yokr City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1, 2))
with(airquality, {
    plot(Wind, Ozone, main = 'Ozone and Wind')
    plot(Solar.R, Ozone, main = 'Ozone and Solar Radiation')
})

par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
    plot(Wind, Ozone, main = 'Ozone and Wind')
    plot(Solar.R, Ozone, main = 'Ozone and Solar Radiation')
    plot(Temp, Ozone, main = 'Ozone and Temperature')
    mtext('Ozone and Weather in New York City', outer = T)
})