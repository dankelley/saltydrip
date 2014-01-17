if (!interactive()) 
    png("coastline_new.png",width=7,height=3,unit="in",res=100,pointsize=8)

library(oce)
load("coastlineWorldCoarse.rda")
load("coastlineWorldMedium.rda")
load("coastlineWorldFine.rda")

## Two panels illustrate two oceanographic centres.
par(mfrow=c(1,2))

## Left panel: Halifax NS, with grey for existing
## world coastline blue for a 1:10m version under
## consideration, and blue for a 1:50m version.
plot(coastlineWorld, clon=-63.60, clat=44.65, span=200)
lines(coastlineWorldCoarse[['longitude']], coastlineWorldCoarse[['latitude']], col='green', lwd=1.4)
lines(coastlineWorldMedium[['longitude']], coastlineWorldMedium[['latitude']], col='blue', lwd=1.4)
lines(coastlineWorldFine[['longitude']], coastlineWorldFine[['latitude']], col='red', lwd=1.4)

## Right panel: similar but for Woods Hole MA.
plot(coastlineWorld, clon=-70.70, clat=41.65, span=200)
lines(coastlineWorldCoarse[['longitude']], coastlineWorldCoarse[['latitude']], col='green', lwd=1.4)
lines(coastlineWorldMedium[['longitude']], coastlineWorldMedium[['latitude']], col='blue', lwd=1.4)
lines(coastlineWorldFine[['longitude']], coastlineWorldFine[['latitude']], col='red', lwd=1.4)

if (!interactive())
    dev.off()


