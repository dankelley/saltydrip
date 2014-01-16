## Map with lines for sunrise/sunset direction on 2013 winter solstice.

# should not need to edit below the next four lines
t <- as.POSIXct("2013-12-21 17:11:00", tz="UTC") # winter solstice
xy <- list(x=1.8262, y=51.1788)        # centre of map (Stonehenge)
D <- 10                                # map span in km

library(oce)
library(OpenStreetMap)

t0 <- t - 86400 / 4
sunrise <- uniroot(function(t)
                   sunAngle(numberAsPOSIXct(t),
                            lat=xy$y, lon=xy$x)$altitude,
                   interval=as.numeric(c(t0, t)))$root
sunrise <- numberAsPOSIXct(sunrise)
azimuth <- 90 - sunAngle(sunrise, lat=xy$y, lon=xy$x)$azimuth
D <- D / 111                           # deg
Dlon <- D / cos(xy$y * pi / 180)
map <- openmap(c(lat=xy$y+D/2, lon=xy$x-Dlon/2),
               c(lat=xy$y-D/2, lon=xy$x+Dlon/2),
               type="bing",
               minNumTiles=9)
plot(map)
## cx and cy are in "map units", needed for lines
cx <- mean(par('usr')[1:2])
cy <- mean(par('usr')[3:4])
points(cx, cy, col='red')
d <- diff(par('usr')[3:4]) # scales as the map
for (o in d*seq(-1, 1, length.out=30)) {
    lines(cx+c(-1,1)*d*cos(azimuth*pi/180),
          cy+o+c(-1,1)*d*sin(azimuth*pi/180), col='red')
}

mtext(sprintf("sunrise angles on day of winter solstice (%s)",
              format(t, "%Y-%m-%d")), side=3, line=2, cex=1.5)

