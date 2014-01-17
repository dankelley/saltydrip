if (!interactive()) 
    png("compare_coastline.png", width=7, height=3, unit="in", res=100, pointsize=8)

library(oce)
d <- read.oce("ne_10m_admin_0_countries.shp")

## Two panels illustrate two oceanographic centres
par(mfrow=c(1,2))

## Left: Halifax NS, with grey for existing coastline
## and blue for the higher-resolution version.
plot(coastlineWorld, clon=-63.60, clat=44.65, span=200)
lines(d[['longitude']], d[['latitude']], col='blue', lwd=2)

## Right: as left, but for Woods Hole MA.
plot(coastlineWorld, clon=-70.70, clat=41.65, span=200)
lines(d[['longitude']], d[['latitude']], col='blue', lwd=2)

if (!interactive())
    dev.off()

