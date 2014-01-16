## gnonom style sundial
if (!interactive())
    pdf("sundial_with_gnomon.pdf", width=7, height=7, pointsize=13)

library(oce)
sundial <- function(day=as.POSIXct("2014-01-01", tz="UTC"),
                    lon=-63.60, lat=44.65, # Halifax NS Canada
                    season=1)
{
    col <- 1:4
    glwd <- 8
    timezone <- floor(0.5 + lon / 15)
    L <- 1                           # horiz gnomon length (arbitrary)
    nhours <- 24
    hours <- seq.POSIXt(day, by="1 hour", length.out=nhours)
    first <- TRUE
    for (hour in seq_along(hours)) {
        t <- hours[hour]
        tlocal <- t + 3600 * timezone
        sa <- sunAngle(t, lon=lon, lat=lat)
        gy <- seq(0, L, length.out=10)
        gx <- rep(0, length(gy))
        gz <- gy * tan(lat * pi / 180)
        R <- gz / tan(-sa$altitude * pi / 180) # radius of shadow
        theta <- (90 - sa$azimuth) * pi / 180
        par(mar=rep(2, 4))
        x <- gx + R * cos(theta)
        y <- gy + R * sin(theta)
        len <- sqrt(x^2 + y^2)
        x <- x / len * L
        y <- y / len * L
        if (sa$altitude > 0) {
            cat(format(t), "UTC is during daytime (season ", season, ")\n", sep="")
            if (season == 1 && first) {
                first <- FALSE
                D <- L * 5
                plot(x, y, type='l', pch=20, asp=1,
                     xlim=c(-L, L), ylim=c(-L/5, L),
                     axes=FALSE, col=col[season], xlab="", ylab="")
                segments(0, 0, 0, L, lwd=glwd, col='gray') # gnomon
                grid()
                abline(h=0, lwd=1.5*par('lwd'))
                abline(v=0, lwd=1.5*par('lwd'))
                mtext("South", side=1, at=0)
                mtext("West", side=2, at=0)
                mtext("North", side=3, at=0)
                mtext("East", side=4, at=0)
                cat("A\n")
                legend("topright", lwd=glwd, col="gray", legend="Gnomon")
                legend("bottomright", legend=sprintf("%.3fE %.3fN", lon, lat))
                legend("topleft", lwd=par('lwd'),
                       col=1:4,
                       cex=3/4,
                       legend=c("Winnter solstice",
                                "Spring equinox",
                                "Summer solstice",
                                "Autumn equinox"))
                box()
                points(0, 0, pch=20, cex=2)
                cat("A\n")
                segments(0, 0, x, y, col=col[season])
            } else {
                ##points(x, y, type='p', pch=20, col=col)
                segments(0, 0, x, y, col=col[season])
            }
            xend <- tail(x, 1)
            yend <- tail(y, 1)
            if (season==3)
                text(xend, yend, format(tlocal, "%H"), pos=3)

        } else {
            cat(format(t), "UTC is during nighttime (season", season, ")\n")
        }
        ##print(data.frame(t, x,y))
    }
}
sundial(as.POSIXct("2013-12-21", tz="UTC"), season=1) # winter solstice
sundial(as.POSIXct("2014-03-20", tz="UTC"), season=2) # spring equinox
sundial(as.POSIXct("2014-06-21", tz="UTC"), season=3) # summer solstice
sundial(as.POSIXct("2014-09-23", tz="UTC"), season=4) # autumn equinox

if (!interactive()) dev.off()

