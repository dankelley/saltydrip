## Three resolutions for region near Halifax NS.  Grey is
## the existing world coastline, blue is the candidate
## 1:10m world coastline, and red is a high-resolution
## coastline that is restricted to the Maritime provinces
## of Canada.

if (!interactive()) 
    png("coastline2.png",width=7,height=7,unit="in",res=100,pointsize=12)

library(oce)

plot(coastlineWorld, clon=-63.60, clat=44.65, span=200)
d <- read.oce("ne_10m_admin_0_countries.shp")
lines(d[['longitude']], d[['latitude']], col='blue')
lines(coastlineMaritimes[['longitude']],
      coastlineMaritimes[['latitude']], col='red')

if (!interactive())
    dev.off()


