## noontime position of shadow of top of pole of height L
if (!interactive())
    png("sundial.png", width=7, height=7, unit="in", res=100, pointsize=16)

library(oce)
sundial <- function(day=as.POSIXct("2014-01-01", tz="UTC"),
                    lon=0, lat=42.98, add=FALSE, col='black')
                    #lon=-0.0015, lat=51.4778, add=FALSE, col='black')
{
    t <- seq.POSIXt(day, by="1 hour", length.out=24)
    sa <- sunAngle(t, lon=lon, lat=lat)
    L <- 0.2                           # height of straight pole
    R <- -L / tan(sa$altitude * pi / 180) # radius of shadow
    theta <- (90 - sa$azimuth) * pi / 180
    par(mar=rep(0.25, 4))
    R <- -1 * if (add) 0.75 else 1
    x <- R * cos(theta)
    y <- R * sin(theta)
    day <- sa$altitude > 0
    if (add) {
        points(x[day], y[day], type='p', pch=20, col=col)
        segments(0, 0, x[day], y[day], col=col)
    } else {
        D <- L * 5
        plot(x[day], y[day], type='p', pch=20, asp=1,
             xlim=c(-D, D), ylim=c(-D/2, 1.5*D),
             axes=FALSE, col=col, xlab="", ylab="")
        box()
        points(0, 0, pch=20, cex=2, col='red')
        segments(0, 0, x[day], y[day], col=col)
    }
    text(x[day], y[day], format(t, "%H")[day], pos=3, cex=if(add)0.5 else 1)
    print(data.frame(t, x,y))
}

sundial(as.POSIXct("2013-12-21", tz="UTC"), col='blue') # winter solstice
#sundial(as.POSIXct("2014-06-01", tz="UTC"), add=TRUE)
sundial(as.POSIXct("2014-06-21", tz="UTC"), add=TRUE) # summer solstice
if (!interactive()) dev.off()
