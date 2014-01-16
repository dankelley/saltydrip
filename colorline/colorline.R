if (!interactive()) png("colorline.png", width=7, height=5, unit="in", res=150, pointsize=10)
library(oce)
x <- 1:50
y <- x*2/10 + x^2/10
z <- seq(0, 5, length.out=length(x))
zlim <- range(z)
npalette <- 10

palette <- oceColorsJet(npalette)
drawPalette(zlim=zlim, col=palette)
plot(x, y, type='l')
segments(head(x,-1), head(y,-1),
         tail(x,-1),tail(y,-1),
         col=palette[findInterval(z, seq(zlim[1], zlim[2], length.out=npalette))],
         lwd=10)
points(x, y, pch=20)
if (!interactive()) dev.off()
