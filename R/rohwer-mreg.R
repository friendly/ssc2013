# now requires heplots-1.0-8 for cex= to have an effect

cd("c:/documents/presentations/ssc2013/figures")

# fit separate models for Lo/Hi SES
rohwer.ses1 <- lm(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer, subset=SES=="Hi")

rohwer.ses2 <- lm(cbind(SAT, PPVT, Raven) ~ n + s + ns + na + ss, data=Rohwer, subset=SES=="Lo")

# duplicates old fig/mreg6, now split into 2 subfigures
op <- par(mar=c(4,4,1,1)+.1)
he <- heplot(rohwer.ses2, col=c("red", rep("black",5), "blue"),
#		hypotheses=list("Overall: B=0" = c("n", "s", "ns", "na", "ss")),
		cex=1.25,
		fill=c(TRUE, TRUE), fill.alpha=0.05,
		xlab="Student Achievement Test",
		ylab="Peabody Picture Vocabulary Test",
		cex.lab=1.25,
		xlim=c(-10, 70), ylim=c(30,90)
		)
dev.copy2pdf(file="rohwer-mreg1a.pdf")

# add H ellipse for overall regression
he <- heplot(rohwer.ses2, col=c("red", rep("black",5), "blue"),
		hypotheses=list("Overall: B=0" = c("n", "s", "ns", "na", "ss")),
		cex=1.25, 
		add=TRUE,
		fill=c(TRUE, TRUE), fill.alpha=0.1,
#		xlab="Student Achievement Test",
#		ylab="Peabody Picture Vocabulary Test",
#		cex.lab=1.25,
		xlim=c(-10, 70), ylim=c(30,90)
		)
dev.copy2pdf(file="rohwer-mreg1b.pdf")
par(op)



# duplicates fig/mreg5
op <- par(mar=c(4,4,1,1)+.1)
he2 <- heplot(rohwer.ses2, col=c("red", rep("black",5), "blue"),
		hypotheses=list("B=0, Low SES" = c("n", "s", "ns", "na", "ss")),
		level=0.5, cex=1.25,
		fill=c(TRUE, FALSE), fill.alpha=0.05,
		xlab="Student Achievement Test",
		ylab="Peabody Picture Vocabulary Test",
		label.pos=c(1, rep(NULL, 5), 1),
		xlim=c(-15, 110), ylim=c(40,110)
		)
dev.copy2pdf(file="rohwer-mreg2a.pdf")

# duplicates fig/mreg5
he1 <- heplot(rohwer.ses1, col=c("red", rep("black",5), "blue"),
		hypotheses=list("B=0, High SES" = c("n", "s", "ns", "na", "ss")),
		level=0.5, cex=1.25,
		add=TRUE, error=TRUE,
		fill=c(TRUE, FALSE), fill.alpha=0.05,
#		label.pos=c(rep(NULL, 6), 1),
		xlim=c(-15, 110), ylim=c(40,110)
		)
dev.copy2pdf(file="rohwer-mreg2b.pdf")
par(op)




## Rohwer data, multivariate multiple regression/ANCOVA
#-- ANCOVA, assuming equal slopes
rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ SES + n + s + ns + na + ss, data=Rohwer)
Anova(rohwer.mod)
col <- c("red", "black", "blue", "cyan", "magenta", "brown", "gray")

heplot(rohwer.mod, col=col, xlab="Student Achievement Test",
	ylab="Peabody Picture Vocabulary Test", cex.lab=1.25, cex=1.25)

# Add ellipse to test all 5 regressors
heplot(rohwer.mod, hypotheses=list("Regr" = c("n", "s", "ns", "na", "ss")), 
	xlab="Student Achievement Test",
	ylab="Peabody Picture Vocabulary Test", 
	cex.lab=1.25, cex=1.25
	col=col, fill=TRUE, fill.alpha=0.1)
