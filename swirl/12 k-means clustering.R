cmat
# first step
points(cx, cy, col = c('red', 'orange', 'purple'), pch = 3, cex = 2, lwd = 2)

mdist(x, y, cx, cy)
apply(distTmp, 2, which.min)
points(x, y, pch = 19, cex = 2, col = cols1[newClust])

# second
tapply(x, newClust, mean)
tapply(y, newClust, mean)
points(newCx, newCy, col = cols1, pch = 8, cex = 2, lwd = 2)

mdist(x, y, newCx, newCy)
apply(distTmp2, 2, which.min)

points(x, y, pch = 19, cex = 2, col = cols1[newClust2])

# third
tapply(x, newClust2, mean)
tapply(y, newClust2, mean)
points(finalCx, finalCy, col = cols1, pch = 9, cex = 2, lwd = 2)

# runnig kmeans algorithm
kmeans(dataFrame, centers = 3)
kmObj$iter
plot(x, y, col = kmObj$cluster, pch = 19, cex = 2)
points(kmObj$centers, col = c('black', 'red', 'green'), pch = 3, cex = 3, lwd = 3)

# now six clusters
plot(x, y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
plot(x, y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
plot(x, y, col = kmeans(dataFrame, 6)$cluster, pch = 19, cex = 2)
