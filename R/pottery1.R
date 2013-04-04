## Examples for DSC paper
setwd("c:/sasuser/datavis/manova/R")

#opar <- par(ask=TRUE)
oopt <- options(prompt="R> ")
library(heplots) 

# Example 1: Pottery data


#str(Pottery)
pottery.mod <- lm(cbind(Al, Fe, Mg, Ca, Na) ~ Site, data=Pottery)
Anova(pottery.mod)

# All 4 multivariate tests
summary(Anova(pottery.mod), univariate=FALSE, digits=4)

#@# fig:pottery1
heplot(pottery.mod, col=c("red", "darkgreen"), main="Pottery data: Al and Fe")
text(12.5,8.5, "Site: 3df H", col="darkgreen", cex=2)
dev.copy2eps(file="pottery1-1.eps")


# add a 2 df hypothesis
heplot(pottery.mod, terms=FALSE, add=TRUE, col="blue",
  hypotheses=list("Caldicot & Isle Thorns" = c("SiteCaldicot = 0",
"SiteIsleThorns=0")))
text(17.5,3.6, "2 df H", col="blue", cex=1.5)
dev.copy2eps(file="pottery1-2.eps")

# show separate 1 df tests
heplot(pottery.mod, terms=FALSE, add=TRUE, col="brown",
  hypotheses=list("C-A" = "SiteCaldicot",
                  "I-A" = "SiteIsleThorns")
       )
text(15, 4.2, "1 df H", col="brown", cex=1.5)
dev.copy2eps(file="pottery1-3.eps")


heplot3d(pottery.mod, col=c("pink", "lightgreen"))
