library(candisc)

data(Rohwer, package="heplots")
X <- as.matrix(Rohwer[,6:10])  # the PA tests
Y <- as.matrix(Rohwer[,3:5])   # the aptitude/ability variables

cc <- cancor(X, Y, set.names=c("PA", "Ability"))

cc <- cancor(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer,
          set.names=c("PA", "Ability"))

cd("c:/documents/presentations/ssc2013/figures")
pdf(file="rohwer-cancor.pdf", height=6, width=6)
op <- par(mar=c(4,4,1,1)+.1)
plot(cc, smooth=TRUE, id.n=3, ellipse.args=list(fill=TRUE), col.smooth="blue", lwd=3,
	cex.lab=1.4, id.cex=1.25, pch=20, cex=1.5)
text(-2,1.75, "1st Canonical dimension:\n    CanR=0.67 (77.3%)", pos=4, cex=1.4)
par(op)
dev.off()

pdf(file="rohwer-cancor2.pdf", height=6, width=6)
op <- par(mar=c(4,4,1,1)+.1)
plot(cc, which=2, smooth=TRUE, id.n=3, ellipse.args=list(fill=TRUE), col.smooth="blue", lwd=3,
	cex.lab=1.4, id.cex=1.25, pch=20, cex=1.5)
text(-2.9,2.2, "2nd Canonical dimension:\n    CanR=0.38 (16.3%)", pos=4, cex=1.4)
par(op)
dev.off()

pdf(file="rohwer-cancor-HE.pdf", height=5.4, width=6)
op <- par(mar=c(4,4,1,1)+.1)
heplot(cc, scale=1.4, var.cex=1.5, var.lwd=3, prefix="Y canonical dimension", cex.lab=1.25, lwd=2)
par(op)
dev.off()
