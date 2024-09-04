

## Problem Set - 1 Solution


# Chapter 9.3 
# 15.

# a.
# Null : mu >= 1056
# Alternative : mu < 1056


# b.
# Enter the data

mu0 <- 1056
n <- 400
xbar <- 910
sigma <- 1600
alpha <- 0.05

zcalc <- (xbar - mu0) / (sigma / sqrt(n))

zcalc

qnorm(alpha)


# since -1.825 < -1.644854, we can reject the Null
# This is based on the critical value approach

abs_zcalc <- abs(zcalc)
pvalue <- 1 - pnorm(abs_zcalc)
pvalue

# 0.03400051 < 0.05, so this means
# p value < alpha 
# so we can reject the null

#---------------------------------------
# 16.


#a.

# Null : mu <= 3173
# Alternative : mu > 3173


# b.
mu0 <- 3173
n <- 180
xbar <- 3325
sigma <- 1000
alpha <- 0.05

zcalc <- (xbar - mu0) / (sigma / sqrt(n))

zcalc

qnorm(1 - alpha)

# so zcalc >= z(1-alpha), so we can reject the null

# let's do the test using the p value approach



abs_zcalc <- abs(zcalc)
pvalue <- 1 - pnorm(abs_zcalc)
pvalue

# here the p value is 0.02071035 < alpha, so we can reject the null.



# 21.

# a.

# Null : mu <= 15
# Alternative : mu > 15



# b.

mu0 <- 15
n <- 35
sigma <- 4
alpha <- 0.01


# So we need to load the data in R
setwd("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/Books/DataSets/Anderson/Chapter 09/")

# following 3 commands will be automatically run by Rstudio, no need to run
library(readxl)
Fowle <- read_excel("Fowle.xlsx")
View(Fowle)

# save an object called data 
data <- Fowle$Time


# calculate the sample mean
xbar <- mean(data)


# calculate the value of the test statistic
zcalc <- (xbar - mu0) / (sigma / sqrt(n))

zcalc

qnorm(1 - alpha)


# so because the zcalc > z(1 - alpha) we can reject the null


# p value approach

abs_zcalc <- abs(zcalc)
pvalue <- 1 - pnorm(abs_zcalc)
pvalue

# here the pvalue < alpha, so we can reject the null.
















