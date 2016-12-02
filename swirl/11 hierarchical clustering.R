dist(dataFrame)
hc <- hclust(distxy)
plot(hc)
plot(as.dendrogram(hc))
abline(h = 1.5, col = 'blue')
abline(h = .4, col = 'red')
5
12
abline(h = 0.05, col = 'green')

dist(dFsm)

hc

# heatmaps
# tutorial on heatmaps: http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering
heatmap(dataMatrix, col = cm.colors(25))
heatmap(mt)
mt
plot(denmt)
distmt

