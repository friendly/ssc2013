library(candisc)

data(Rohwer, package="heplots")
X <- as.matrix(Rohwer[,6:10])  # the PA tests
Y <- as.matrix(Rohwer[,3:5])   # the aptitude/ability variables

cc <- cancor(X, Y, set.names=c("PA", "Ability"))

cd("c:/documents/presentations/ssc2013/figures")
pdf(file="rohwer-cancor.pdf", height=6, width=6)
op <- par(mar=c(4,4,1,1)+.1)
plot(cc, smooth=TRUE, id.n=3, ellipse.args=list(fill=TRUE), col.smooth="blue", lwd=3,
	cex.lab=1.4, id.cex=1.25, pch=20, cex=1.5)
text(-2,1.9, "Canonical correlation analysis: Abilities ~ PA tasks", pos=4, cex=1.3)
par(op)
dev.off()
