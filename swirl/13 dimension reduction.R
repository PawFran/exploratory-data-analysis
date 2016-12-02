head(dataMatrix)
heatmap(dataMatrix)

myedit('addPatt.R')
set.seed(678910)
for(i in 1:40){
    # flip a coin
    coinFlip <- rbinom(1,size=1,prob=0.5)
    # if coin is heads add a common pattern to that row
    if(coinFlip){
        dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
    }
}
source('addPatt.R', local = TRUE)

heatmap(dataMatrix)

### SVD and PCA ###
# small data examples
mat
svd(mat)
matu %*% diag %*% t(matv) # not unique ?

svd(scale(mat))
prcomp(scale(mat))

# return to the previous example
svd1$v[, 1]
# first left singular vector is associated with row means of the matrix
# first right singular vector is associated with the column means

# "The diagonal entries of D are like
# weights for the U and V columns accounting for the variation in the data. 
# They're given in decreasing order from
# highest to lowest."
svd1$d

# another example for variance explained
head(constantMatrix)
svd2$d
svd2$v[, 1:2]
svd2$d

# SVD and PCA cannot deal with missiing data

# final example
dim(faceData)
a1 <- (svd1$u[, 1] * svd1$d[1]) %*% t(svd1$v[, 1])
myImage(a1)

a2 <- svd1$u[, 1:2] %*% diag(svd1$d[1:2]) %*% t(svd1$v[, 1:2])
myImage(a2)

myImage(svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[, 1:5]))
myImage(svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[, 1:10]))

# scale matters
# final remarks