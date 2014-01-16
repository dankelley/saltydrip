if (!interactive()) png("daylength.png", width=7, height=4, unit="in", res=100, pointsize=9)
library(oce)
daylength <- function(t, lon=-63.60, lat=44.65)
{
    t <- as.numeric(t)
    alt <- function(t)
        sunAngle(t, longitude=lon, latitude=lat)$altitude
    rise <- uniroot(alt, lower=t-86400/2, upper=t)$root
    set <- uniroot(alt, lower=t, upper=t+86400/2)$root
    set - rise
}
## December 2013
solstice <- as.POSIXct("2013-12-21", tz="UTC")
t0 <- as.POSIXct("2013-12-01 12:00:00", tz="UTC")
t <- seq.POSIXt(t0, by="1 day", length.out=31)
dayLength <- unlist(lapply(t, daylength))

## Two panels, with tightened margins
par(mfrow=c(2,1), mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0))

## Top panel: day length
plot(t, dayLength/3600, type='l', pch=20,
     xlab="", ylab="Day length (hours)")
abline(v=solstice+c(0, 86400))
abline(h=12)

## Bottom panel: daily change in day length
plot(t[-1], diff(dayLength), type='l', pch=20,
     xlab="Day in 2013", ylab="Seconds gained per day")
abline(v=solstice+c(0, 86400))
abline(h=seq(-180, 180, 60), lty='dotted', col='gray')
if (!interactive()) dev.off()
