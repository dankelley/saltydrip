library(ggmap)
location = c(lon=-6.4754, lat=53.69475)
mapImageData1 <- get_map(location=location, maptype="satellite",
                         source="google", zoom=19)
ggmap(mapImageData1,extent="device", xlab="Latitude", ylab="Longitude")

## The above is fine but I don't know how to do the equivalent
## to abline() in ggmap.

if (FALSE) {
    t <- as.POSIXct("2013-12-21 17:11:00", tz="UTC") # winter solstice

    library(oce)
    t0 <- t - 86400 / 4
    sunrise <- uniroot(function(t)
                       sunAngle(numberAsPOSIXct(t),
                                lat=location[["lat"]],
                                lon=location[["lon"]])$altitude,
                       interval=as.numeric(c(t0, t)))$root
    sunrise <- numberAsPOSIXct(sunrise)
    azimuth <- 90 - sunAngle(sunrise, lat=location[["lat"]], lon=location[["lon"]])$azimuth
    slope <- tan(azimuth*pi/180)
    for (o in d*seq(-1, 1, length.out=30)) {
        lines(cx+c(-1,1)*d*cos(azimuth*pi/180),
              cy+o+c(-1,1)*d*sin(azimuth*pi/180), col='red')
    }
}

