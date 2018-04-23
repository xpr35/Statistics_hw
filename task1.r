snd <- read.table("frst.txt")
snd <- unlist(snd, use.names=FALSE)
alpha = 0
epsilon = .11
sigma = .9
n = 50
dof = n-1
X = mean(snd)

#first, find confidence interval for alpha if sigma is known
q = sqrt(sigma)*qnorm(epsilon/2, lower.tail=FALSE)/sqrt(length(snd))
print("confidence interval for alpha, sigma known");
print(X-q)
print(X+q)

#second, find confidence interval for alpha if sigma is unknown
tau = qt(epsilon/2, dof, lower.tail=FALSE)
S0sq = 1/(n-1) * sum((snd-X)^2)
print("confidence interval for alpha, sigma unknown")
print(X+(tau*sqrt(S0sq)/sqrt(n)))
print(X-(tau*sqrt(S0sq)/sqrt(n)))

#third, find confidence interval for sigma if alpha known
S1sq = sum((snd-alpha)^2)/n
left_q = qchisq(epsilon/2, n)
right_q = qchisq(epsilon/2, n, lower.tail=FALSE)
print("confidence interval for sigma, alpha known")
print(n*S1sq/left_q)
print(n*S1sq/right_q)

#fourth, find confidence interval for sigma if alpha unknown
left_q = qchisq(epsilon/2, dof)
right_q = qchisq(epsilon/2, dof, lower.tail=FALSE)
print("confidence interval for sigma, alpha unknown")
print(n*S1sq/left_q)
print(n*S1sq/right_q)
