

# Chapter 9.4

# a.
# Null : mu = 5
# Alternative : mu not= 5


# b.

# load the data first and then save them in a object data

data <- ResidentialWater$`Rate (5 CCF)`


mu0 <- 21.62
alpha <- 0.05

n <- length(data)
xbar <- mean(data)
s <- sd(data)


# let's do the test using critical value approach

tcalc <- (xbar - mu0) / (s / sqrt(n))
tcalc


# t(1 - alpha/2)
qt(1 - alpha/2, n - 1)


# t(alpha/2)
qt(alpha/2, n - 1)


# so based on the critical value approach we can accept the null


# let's do the same test using p value approach

 
abs_tcalc <- abs(tcalc)
pvalue <- 2 * (1 - pt(abs_tcalc, n - 1))
pvalue


# So in this case the pvalue > alpha so we are accepting the null



