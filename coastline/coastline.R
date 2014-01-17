if (!interactive()) 
    png("coastline.png",width=7,height=3,unit="in",res=100,pointsize=8)

library(oce)
d <- read.oce("ne_10m_admin_0_countries.shp")

## Two panels illustrate two oceanographic centres.
par(mfrow=c(1,2))

## Left panel: Halifax NS, with grey for existing
## world coastline blue for the 1:10m version under
## consideration.
plot(coastlineWorld, clon=-63.60, clat=44.65, span=200)
lines(d[['longitude']], d[['latitude']], col='blue', lwd=1.4)

## As left panel, but for Woods Hole MA.
plot(coastlineWorld, clon=-70.70, clat=41.65, span=200)
lines(d[['longitude']], d[['latitude']], col='blue', lwd=1.4)

if (!interactive())
    dev.off()


