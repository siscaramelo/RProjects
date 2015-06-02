x <- rnorm(100)
y <- x + rnorm(100)
par(las = 1)
plot(x, y)

par(las = 2)
plot(x, y)

x <- rnorm(100)
y <- x + rnorm(100)
plot(x, y)

x1 <- rnorm(10)
y1 <- rnorm(10)
points(x1, y1, col = "red")

lines(x,y)
text(y)


pdf(file = "testRplot.pdf")
x <- rnorm(100)
hist(x)
dev.off()

## Lattice plots
library(lattice)
library(nlme)
xyplot(distance ~ age | Subject, data = Orthodont)
xyplot(distance ~ age | Subject, data = Orthodont, type = "b")