lkbrary(mvinfluence)
library(heplots)

Rohwer2 <- subset(Rohwer, subset=group==2)
rownames(Rohwer2)<- 1:nrow(Rohwer2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)

cd("c:/documents/presentations/ssc2013/figures")

op <- par(mar=c(4,4,1,1)+.1)
influencePlot(Rohwer.mod, id.n=3, type="cookd", cex.lab=1.4, id.cex=1.25)
dev.copy2pdf(file="rohwer-influence-cookd.pdf", height=6, width=6)

influencePlot(Rohwer.mod, id.n=3, type="stres", cex.lab=1.4, id.cex=1.25)
dev.copy2pdf(file="rohwer-influence-stres.pdf", height=6, width=6)

#pdf(file="rohwer-influence.pdf", height=6, width=6)
influencePlot(Rohwer.mod, id.n=3, type="LR", cex.lab=1.4, id.cex=1.25)
dev.copy2pdf(file="rohwer-influence-LR.pdf", height=6, width=6)
par(op)
#dev.off()



