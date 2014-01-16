## noontime position of shadow of top of pole of height L
if (!interactive())
    png("sundial.png", width=7, height=7, unit="in", res=100, pointsize=16)

library(oce)
sundial <- function(as.POSIXct("2014-01-01 12:00:00", tz="UTC"),
                    lon=-0.0015, lat=51.4778)
{
    t <- seq.POSIXt(t0, by="1 hour", length.out=24)

    sa <- sunAngle(t, lon=lon, lat=lat)
    L <- 0.2                               # height of straight pole
    R <- L * cos(sa$altitude * pi / 180)   # radius of shadow
    theta <- (90 - sa$azimuth) * pi / 180
    par(mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0)) # tighten margins
    x <- R * cos(theta)
    y <- R * sin(theta)
    plot(x, y, type='p', pch=20, asp=1,
         xlab="distance [m]", ylab="distance [m]")
    points(0, 0, pch=20, cex=2)
    daylight <- sa$altitude > 0
    text(x, y, format(t, "%H"), pos=3, col=ifelse(daylight, "blue", "red"))
}

sundial("2014-12-01 12:00:00", tz="UTC")
if (!interactive()) dev.off()
