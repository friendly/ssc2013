# Pottery data
cd("c:/documents/presentations/ssc2013/figures")

pottery.mod <- lm(cbind(Al,Fe,Mg,Ca,Na)~Site, data=Pottery)
Anova(pottery.mod)
pottery.rmod <- robmlm(cbind(Al,Fe,Mg,Ca,Na)~Site, data=Pottery)
Anova(pottery.rmod)

# index plot of weights
op <- par(mar=c(4,4,1,1)+.1)
plot(pottery.rmod$weights, type="h", col="gray", ylab="Observation weight", cex.lab=1.5)
points(pottery.rmod$weights, pch=16, col=Pottery$Site, cex=1.5)
prle <- rle(as.numeric(Pottery$Site))
loc <- c(1,cumsum(prle$lengths)[-4])
text(loc, rep(c(-0.01,0.03),length=4), levels(Pottery$Site)[prle$values], pos=4, cex=1.5)
par(op)
dev.copy2pdf(file="pottery-weights.pdf", height=6, width=6)


# heplots to see effect of robmlm vs. mlm

pdf(file="pottery-robust.pdf", height=6, width=6)
op <- par(mar=c(4,4,1,1)+.1)
heplot(pottery.mod, cex=1.3, lty=1, cex.lab=1.4)
heplot(pottery.rmod, add=TRUE, error.ellipse=TRUE, lwd=c(2,2), lty=c(2,2), 
	term.labels=FALSE, err.label="", fill=TRUE, fill.alpha=0.1)
legend(15.5, 8.5, c("Classical", "Robust"), col="blue", lty=c(1,2), bg='gray96', cex=1.6, lwd=3)
par(op)
dev.off()



