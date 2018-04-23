library("texmex")
u <- read.table("secnd.txt")
v <- unlist(u, use.names=FALSE)
e <- edf(v)
epsilon = 0.11
n = 30
Dn = max(e-v)
q = 1.21 # data from table
print(q)
print(sqrt(n)*Dn)
if (sqrt(n)*Dn < q) {
	print("Accept")
} else {
	print("Decline")
}
