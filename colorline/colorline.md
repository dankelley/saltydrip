*Abstract.* Demonstrate how to colourize an (x,y) curve according to z.

**1. Introduction.**

In Oceanography it can be useful to use colour to display z values along an (x,y) trajectory.  For example, CTD data might be displayed in this way, with x being distance along track, y being depth, and z being temperature. This post shows how one might do this generally with fake data.

**2. Methods.**

The R code given below demonstrates this with fake data.  The core idea is to use ``segments()``, here with ``head()`` and ``tail()`` to chop up the trajectory.


```r
library(oce)
```

```
## Loading required package: mapproj
## Loading required package: maps
## Loading required package: ocedata
```

```r
x & lt
```

```
## Error: object 'x' not found
```

```r
-1:50
```

```
##  [1] -1  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21
## [24] 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44
## [47] 45 46 47 48 49 50
```

```r
y & lt
```

```
## Error: object 'y' not found
```

```r
-x * 2/10 + x^2/10
```

```
## Error: object 'x' not found
```

```r
z & lt
```

```
## Error: object 'z' not found
```

```r
-seq(0, 5, length.out = length(x))
```

```
## Error: object 'x' not found
```

```r
zlim & lt
```

```
## Error: object 'zlim' not found
```

```r
-range(z)
```

```
## Error: object 'z' not found
```

```r
npalette & lt
```

```
## Error: object 'npalette' not found
```

```r
-10
```

```
## [1] -10
```

```r

palette & lt
```

```
## Error: object 'lt' not found
```

```r
-oceColorsJet(npalette)
```

```
## Error: object 'npalette' not found
```

```r
drawPalette(zlim = zlim, col = palette)
```

```
## Error: object 'zlim' not found
```

```r
plot(x, y, type = "l")
```

```
## Error: error in evaluating the argument 'x' in selecting a method for function 'plot': Error: object 'x' not found
```

```r
segments(head(x, -1), head(y, -1), tail(x, -1), tail(y, -1), col = palette[findInterval(z, 
    seq(zlim[1], zlim[2], length.out = npalette))], lwd = 10)
```

```
## Error: object 'x' not found
```

```r
points(x, y, pch = 20)
```

```
## Error: object 'x' not found
```



**3. Results.**

The graph shows that this works reasonably well.  The dots will probably not be useful in an actual application, and are used here just to indicate colourization in groups.

[caption id="attachment_310" align="alignnone" width="504"]<a href="http://saltydrip.files.wordpress.com/2014/01/unnamed-chunk-1.png"><img src="http://saltydrip.files.wordpress.com/2014/01/unnamed-chunk-1.png" alt="Demonstration of colourizing an (x,y) trajectory according to the value of a third variable, z." width="504" height="504" class="size-full wp-image-310" /></a> Demonstration of colourizing an (x,y) trajectory according to the value of a third variable, z.[/caption]
**4. Conclusions.**

The method works well, and is flexible in terms of colour schemes.


*Appendix 1: exercises* find a way to blend colour between the points, perhaps by defining a euclidian distance in (x,y) space (which will of course require scaling if x and y have different units or ranges) and then using ``approx()``.
