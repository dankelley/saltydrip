if (!interactive())
    png("analemma.png", width=7, height=7, unit="in", res=100, pointsize=16)

library(oce)
loc <- list(lon=-0.0015, lat=51.4778)  # Greenwich Observatory
t <- seq.POSIXt(as.POSIXct("2014-01-01 12:00:00", tz="UTC"),
                as.POSIXct("2015-01-01 12:00:00", tz="UTC"),
                by="1 d")
sa <- sunAngle(t, lon=loc$lon, lat=loc$lat)
par(mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0)) # tighten margins
plot(sa$azimuth, sa$altitude, type='p', pch=20,
     xlab="Azimuth", ylab="Altitude")
grid()

if (!interactive()) dev.off()
