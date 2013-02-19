library(heplots)

data(Pottery)
pottery.mod <- lm(cbind(Al, Fe, Mg, Ca, Na) ~ Site, data=Pottery)
#heplot(pottery.mod, size="effect")

# get limits
pot <- heplot(pottery.mod)

op <- par(mar=c(4,4,1,1)+.1)
heplot(pottery.mod, size="effect", # col=c("red", "green3"), 
	xlim=pot$xlim, ylim=pot$ylim, main="Pottery data: Al and Fe",
	fill=c(TRUE, TRUE), fill.alpha=0.05, cex.lab=1.25)
label <- expression(paste("Effect scaling:", H / df[e]))
text(12.6, 7.2, label, col="blue", cex=1.5, pos=4)
label <- expression( E / df[e])
text(16.8, 5.2, label, col="red", cex=1.5, pos=4)
par(op)
## snap ##
dev.copy2pdf(file="pottery-HE1a.pdf")

op <- par(mar=c(4,4,1,1)+.1)
heplot(pottery.mod, add=TRUE, col="darkgreen", fill=c(FALSE, TRUE), fill.alpha=0.1)
label <- expression(paste("Significance scaling: H / ",  lambda[alpha], df[e]))
text(10.6, 8.7, label, col="darkgreen", cex=1.5, pos=4)
par(op)
## snap ##
dev.copy2pdf(file="pottery-HE1b.pdf")


#@# fig:pottery-HE2
op <- par(mar=c(4,4,1,1)+.1)
heplot(pottery.mod, col=c("red", "darkgreen"), main="Pottery data: Al and Fe", 
	fill=c(TRUE,FALSE), fill.alpha=0.05, cex.lab=1.25)
text(12.5,8.5, "Site: 3df H", col="darkgreen", cex=2)
dev.copy2pdf(file="pottery-HE2a.pdf")


# add a 2 df hypothesis
heplot(pottery.mod, terms=FALSE, add=TRUE, col="blue",
  hypotheses=list("Caldicot & Isle Thorns" = c("SiteCaldicot = 0",
"SiteIsleThorns=0")), fill=c(FALSE, TRUE), fill.alpha=0.1)
text(17.8,3.6, "2 df H", col="blue", cex=2)
dev.copy2pdf(file="pottery-HE2b.pdf")

# show separate 1 df tests
heplot(pottery.mod, terms=FALSE, add=TRUE, col="brown",
  hypotheses=list("C-A" = "SiteCaldicot",
                  "I-A" = "SiteIsleThorns")
       )
text(13.1, 4.5, "1 df H", col="brown", cex=1.7)
dev.copy2pdf(file="pottery-HE2c.pdf")
par(op)




pairs(pottery.mod, fill=TRUE, fill.alpha=0.1)
dev.copy2pdf(file="pottery-HE3.pdf")
