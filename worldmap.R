library(oce)
load("coastlineWorldFine.rda")         ## candidate for inclusion in oce
load("coastlineWorldMedium.rda")       ## candidate for inclusion in oce
load("coastlineWorldCoarse.rda")       ## candidate for inclusion in oce
png("worldmap.png", width=7, height=7, unit='in', res=150, pointsize=7)
par(mfrow=c(2,2), mar=rep(0, 4))
system.time(mapPlot(coastlineWorld, longitudelim=c(-80,10), latitudelim=c(0,120),
                    projection="orthographic", orientation=c(45,-100,0),fill='grey'))
system.time(mapPlot(coastlineWorldFine, longitudelim=c(-80,10), latitudelim=c(0,120),
                    projection="orthographic", orientation=c(45,-100,0),fill='grey'))
system.time(mapPlot(coastlineWorldMedium, longitudelim=c(-80,10), latitudelim=c(0,120),
                    projection="orthographic", orientation=c(45,-100,0),fill='grey'))
system.time(mapPlot(coastlineWorldCoarse, longitudelim=c(-80,10), latitudelim=c(0,120),
                    projection="orthographic", orientation=c(45,-100,0),fill='grey'))
dev.off()
 
