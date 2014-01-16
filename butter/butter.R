library(signal)
n <- 100
x <- 1:n
y <- ifelse(0.3*n < x & x < 0.7*n, 1, 0)
if (!interactive()) png("butter.png", width=7, height=5, unit="in", res=150, pointsize=9)
plot(x, y, type='o', pch=20, ylim=c(-0.1, 1.1))
b1 <- butter(1, 0.25)
y1 <- filtfilt(b1, y)
points(x, y1, type='o', pch=20, col='red')

b2 <- butter(2, 0.25)
y2 <- filtfilt(b2, y)
points(x, y2, type='o', pch=20, col='blue')

b3 <- butter(3, 0.25)
y3 <- filtfilt(b3, y)
points(x, y3, type='o', pch=20, col='forestgreen')
if (!interactive()) dev.off()

