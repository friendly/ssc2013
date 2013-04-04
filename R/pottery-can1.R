setwd("c:/sasuser/datavis/manova/R")
library(candisc)
pottery.mod <- lm(cbind(Al, Fe, Mg, Ca, Na) ~ Site, data=Pottery)

Manova(pottery.mod)

(pottery.can <-candisc(pottery.mod))
summary(Manova(pottery.mod), digits=3)

heplot(pottery.can, var.lwd=3)

#heplot3d(pottery.can)
# xlim/ylim honored?
heplot3d(pottery.can, scale=12, xlim=c(-15,15), ylim=c(-15,15))

aspect3d("iso")

M1<-par3d("userMatrix")
# dput(round(M1,4))
# M1 <-structure(c(0.993, -3e-04, 0.1185, 0, 0, 1, 0.0024, 0, -0.1185, 
# -0.0024, 0.993, 0, 0, 0, 0, 1), .Dim = c(4L, 4L))


 play3d( spin3d(axis=c(0,1,0)),duration=12 )
 play3d( spin3d(axis=c(1,0,0)), duration=12 )
# combine both
# rot8zy <- spin3d(axis=c(1,0,1))
 rot8xyz <- spin3d(axis=c(1,1,1))
 rot8y <- spin3d(axis=c(0,1,0))

 play3d(rot8xyz, duration=12)

setwd("c:/sasuser/datavis/manova/R")

movie3d(rot8y, duration=12, fps=4, movie="pottery-can1", dir="anim/pottery-can1", clean=FALSE)
