# boxplots of pottery variables

library(car)

op <-par(mfrow=c(2,3), cex.main=3, mar=c(c(3, 3, 3, 2) + 0.1))
#names <-unique(abbreviate(Pottery$Site, 8))
boxplot(Al~abbreviate(Site,8), data=Pottery, main="Al",  col="red", outcex=1.5, outcol="blue", outpch=19)
boxplot(Fe~abbreviate(Site,8), data=Pottery, main="Fe",  col="red", outcex=1.5, outcol="blue", outpch=19)
boxplot(Mg~abbreviate(Site,8), data=Pottery, main="Mg",  col="red", outcex=1.5, outcol="blue", outpch=19)
boxplot(Ca~abbreviate(Site,8), data=Pottery, main="Ca",  col="red", outcex=1.5, outcol="blue", outpch=19)
boxplot(Na~abbreviate(Site,8), data=Pottery, main="Na",  col="red", outcex=1.5, outcol="blue", outpch=19)
par(op)
