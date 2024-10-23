
set.seed(123)

N   <- 500
rho <- 0.5
X1 <- rnorm(N)
X2 <- rho * X1 + rnorm(N, 0, sqrt(1-rho^2))
X <- cbind(X1, X2)

miss  <- rbinom(N, 1, prob = 1/(1+exp(-(-1 + 2*X1))))
Xmiss <- X
Xmiss[miss==1, 2] <- NA

plot(Xmiss, xlim = c(-4, 4), ylim = c(-4, 4))
points(X[miss==1, ], col = "red")

colMeans(X[miss==0,])
colMeans(X[miss==1,])
