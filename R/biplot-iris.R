## biplot of iris data

library(bpca)

iris.pca <- bpca(iris[,-5], method="sqrt", scale=TRUE)
scores <- iris.pca$coord$objects[,1:2]
col <- c( 'blue', 'darkgreen', 'red')[unclass(iris$Species)]

op <- par(mar=c(4,4,1,1)+0.1)
plot(iris.pca,
  var.factor=.24, var.cex=1.3, var.col="black", lwd=2,
  obj.names=FALSE, obj.cex=1, obj.col=col,
  obj.pch=(15:17)[unclass(iris$Species)], 
  xpd=TRUE, cex.lab=1.25)

dataEllipse(scores, add=TRUE, levels=0.68, col="gray", plot.points=FALSE)
dataEllipse(scores, groups=iris$Species, add=TRUE, levels=0.68, col=unique(col), plot.points=FALSE, cex=1.4)
par(op)

dev.copy2pdf(file="biplot-iris.pdf")