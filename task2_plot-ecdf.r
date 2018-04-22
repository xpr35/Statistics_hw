u <- read.table("secnd.txt")
v <- unlist(u, use.names=FALSE)
e <- ecdf(v)
plot(e)
lfn = function(x){x}
curve(lfn, 0, 1, add=TRUE)
