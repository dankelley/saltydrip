# Alter next three lines as desired; a and b are watermasses.
Sa <- 30
Ta <- 10
Sb <- 40

library(oce)
# Should not need to edit below this line
rho0 <- swRho(Sa, Ta, 0)
Tb <- uniroot(function(T) rho0 - swRho(Sb, T, 0), lower=0, upper=100)$root
Sc <- (Sa + Sb) /2
Tc <- (Ta + Tb) /2
## density change, and equiv temp change
drho <- swRho(Sc, Tc, 0) - rho0
dT <- drho / rho0 / swAlpha(Sc, Tc, 0)

if (!interactive()) png("cabelling.png", width=7, height=7, unit="in", res=200, pointsize=9)
plotTS(as.ctd(c(Sa, Sb, Sc), c(Ta, Tb, Tc), 0), pch=20, cex=2)
drawIsopycnals(levels=rho0, col='red', cex=0)
segments(Sa, Ta, Sb, Tb, col='blue')
text(Sb, Tb, "b", pos=4)
text(Sa, Ta, "a", pos=4)
text(Sc, Tc, "c", pos=4)
legend("topleft",
       legend=sprintf("Sa=%.1f, Ta=%.1f, Sb=%.1f  ->  Tb=%.1f, drho=%.2f, dT=%.2f",
                      Sa, Ta, Sb, Tb, drho, dT),
       bg="white")
if (!interactive()) dev.off()

