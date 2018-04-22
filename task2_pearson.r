u <- read.table("secnd.txt")
v <- unlist(u, use.names=FALSE)
d = 0.2
N = 30
p = 0.2
epsilon = 0.11
freedom_dimensions = 4
knots_list = seq(0, 1-d, d)
hitFunc = function(x){sum(v > x & v < x +d)}
hits = lapply(knots_list, hitFunc)

pearson_particle = function(n){(n-N*p)^2/(N*p)}

hisq = lapply(hits, pearson_particle)

q = qchisq(epsilon, freedom_dimensions, lower.tail=FALSE)

pearson = sum(unlist(hisq), use.names=FALSE)

if (pearson < q) {
	print("Accept")
} else {
	print("Denied")
}
