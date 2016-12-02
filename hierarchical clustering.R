set.seed(1234)
old_mar = c(5.1, 4.1, 4.1, 2.1)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = 'blue', pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))
par(mar = old_mar)

# h clustering
df <- data.frame(x = x, y = y)
distxy <- dist(df) # euclidian metrics by default
hClustering <- hclust(distxy)
class(hClustering)
hClustering
plot(hClustering)

# heatmap
dataMatrix <- as.matrix(df)
heatmap(dataMatrix)
