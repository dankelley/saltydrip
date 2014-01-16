Peter Lynch, 2012.
The equation of time and the analemma.
Irish Math. Soc. Bulletin, 69:47-56.
http://www.maths.tcd.ie/pub/ims/bull69/Lynch.pdf

See his Fig 2.



library(oce)
if (!interactive())
    png("analemma.png", width=7, height=7, unit="in", res=100, pointsize=9)
par(mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0))
## Noon in Halifax is 16:00 UTC
t <- seq.POSIXt(as.POSIXct("2014-01-01 16:00:00", tz="UTC"),
                as.POSIXct("2015-01-01 16:00:00", tz="UTC"),
                by="1 day")
##loc <- list(lon=0*-63.60, lat=51.4791+0*44.65)     # Halifax 
loc <- list(lon=-63.60, lat=44.65)     # Halifax 
sa <- sunAngle(t, lon=loc$lon, lat=loc$lat)
plot(sa$azimuth, sa$altitude, type='l',
     asp=1, xlab="Azimuth", ylab="Altitude")
grid()
#for (d in 60 * seq(-60, 60, 10)) {
    sa <- sunAngle(t+18*60, lon=loc$lon, lat=loc$lat)
    lines(sa$azimuth, sa$altitude, col='red')
#}
if (!interactive()) dev.off()
