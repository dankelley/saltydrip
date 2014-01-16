png("moon.png", width=5, height=3, unit="in", res=150, pointsize=8)
library(oce)
par(mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0)) # tighten margins
t <- as.POSIXct("2013-12-1", tz="UTC") + seq(0, 28*24*3600, 3600)
f <- moonAngle(t=t, longitude=-63.6, latitude=44.65)$illuminatedFraction
plot(t, f, type="l", xlab="Day of 2013", ylab="Moon fraction")
grid()
## Time indicate is from an almanac
full <- as.POSIXct("2013-12-17 05:29:00", tz="AST")
abline(v=full)
mtext("full", at=full, side=3)
dev.off()

