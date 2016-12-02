?Devices

# plotting with file devices
pdf(file = 'myplot.pdf')
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')
dev.off()


# vector formats - useful for line graphics
# pdf
# svg - web-based plots
# win.metafile
# postscript

# bitmap formats
# png - good for line drawings or images with solid colors
# jpeg - good for photographs or natural scenes
# tiff
# bmp

# it's possible to have opened many devices at once
# but only one may be active
dev.cur() # checks which device is active. numbers is always 2+
dev.set(2)

# copying plots
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = 'Old Faithful Geyser data')
dev.copy(png, file = 'geyserplot.png')
dev.off()
