data <- list(
  y = y,
)

modelstring <- textConnection(
  "
	  model{
		for (i in 1:n) {
		  x[i]~dnorm(mu,tau)
		}
		mu~dnorm(cc,d)
		tau~dgamma(a,b)
	  }
	"
)
parameters <- c()

inits <- function() {
  list()
}
ni <- 10000
nt <- 1
nb <- 5000
nc <- 3
Model <- jags(data, inits, parameters, modelstring, n.chains = nc, n.thin = nt, n.iter = ni, n.burnin = nb)
