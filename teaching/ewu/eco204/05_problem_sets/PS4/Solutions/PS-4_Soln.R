## -----------------------------------------------------------------------------
# define the function
y_hat <- function(x1, x2, x3){
  output <- 25 + 10*x1 + 8*x2 + 9*x3
  return(output)
}

# test the function
y_hat(2, 1, 5)


## -----------------------------------------------------------------------------
# predict Y
y_hat(15, 10, 5)



## -----------------------------------------------------------------------------
# predict Y
y_hat(x2 = 10, x1 = 15, x3 = 5)


## -----------------------------------------------------------------------------
# SSR
SST <- 6724.125
SSR <- 6216.375
SSE <- SST - SSR
SSE


## -----------------------------------------------------------------------------
# MSR
p <- 2 # already this is defined before
MSR <- SSR / p
MSR


## -----------------------------------------------------------------------------
n <- 10
p <- 2
MSE <- SSE / (n - p - 1)
MSE


## -----------------------------------------------------------------------------

Fcalc <- MSR / MSE
Fcalc


## -----------------------------------------------------------------------------
# find the critical value of F
alpha <- 0.05
n <- 10
p <- 2

# F test is always one tail test, this is F(1-alpha)
Fcrit <- qf(p = 1 - alpha, df1 = p, df2 = n - p - 1)

Fcalc > Fcrit




## -----------------------------------------------------------------------------
# t-test for beta_1
tcalc_beta1 <- (0.5906 - 0) / 0.0813


# it's a two tail test, so let's calculate the p value directly
pvalue_beta1 <- 2 * (1 - pt( abs(tcalc_beta1) , df = n - p - 1) )

pvalue_beta1

pvalue_beta1 < alpha


## -----------------------------------------------------------------------------
# t-test for beta_2
tcalc_beta2 <- (0.4980 - 0) / 0.0567

pvalue_beta2 <- 2 * (1 - pt( abs(tcalc_beta2) , df = n - p - 1) )

pvalue_beta2

pvalue_beta2 < alpha



## -----------------------------------------------------------------------------
# load the library
library(readxl)

# directly load the data
Showtime <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/ps/04_mlr/Solutions/Showtime.xlsx")



## -----------------------------------------------------------------------------
Showtime


## -----------------------------------------------------------------------------
summary(Showtime)


## ----message = FALSE, warning = FALSE-----------------------------------------
# fit the model
model_slr <- lm(revenue ~ tv, data = Showtime)

# view the results with stargazer package
library(stargazer)
stargazer(model_slr, type = "text")


## -----------------------------------------------------------------------------
# fit the model
model_mlr <- lm(revenue ~ ., data = Showtime)

# view the results with stargazer package
library(stargazer)
stargazer(model_mlr, type = "text")


## -----------------------------------------------------------------------------
# fit null model
model_null <- lm(revenue ~ 1, data = Showtime)

# we already have the complete model

# anova function will compare between two models
anova(model_null, model_mlr)



## -----------------------------------------------------------------------------
model_restrict <- lm(revenue ~ tv + newspaper, data = Showtime)



## -----------------------------------------------------------------------------
anova( model_restrict, model_mlr)


## -----------------------------------------------------------------------------
test_data <- data.frame(tv = 3500/1000, newspaper = 2300/1000, magazines = 1000/1000, leaflets = 500/1000)

predict(model_mlr, newdata = test_data)


## -----------------------------------------------------------------------------
predict(model_restrict, newdata = data.frame(tv = 3500/1000, newspaper = 2300/1000), interval = "confidence")



## -----------------------------------------------------------------------------
predict(model_restrict, newdata = data.frame(tv = 3500/1000, newspaper = 2300/1000), interval = "prediction")



## -----------------------------------------------------------------------------
plot(model_mlr$fitted.values, model_mlr$residuals)



## -----------------------------------------------------------------------------
# set the seed for reproducibility
set.seed(1238818)

# fix number of observations
n <- 50

# generate epsilon
epsilon <- rnorm(n, mean = 0, sd = sqrt(.25))
x2 <- rnorm(n, mean = 0, sd = sqrt(.35))
x1 <- runif(n, min = 0, max = 1)

# generate y
beta0 <- 3
beta1 <- 5
beta2 <- 2
y <- beta0 + beta1*x1 + beta2*x2 + epsilon

# create a data frame
sim_data <- data.frame(sales = y, tv = x1, newspaper = x2)

# view the data
sim_data


## -----------------------------------------------------------------------------
# function to generate the data

generate_data <- function(n){
  # generate epsilon
  epsilon <- rnorm(n, mean = 0, sd = sqrt(.25))
  x2 <- rnorm(n, mean = 0, sd = sqrt(.35))
  x1 <- runif(n, min = 0, max = 1)
  
  # generate y
  y <- 3 + 5*x1 + 2*x2 + epsilon
  
  # create a data frame
  sim_data <- data.frame(y, x1, x2)
  
  # return the data
  return(sim_data)
}



## -----------------------------------------------------------------------------
# generate the data for n = 50
# give the data a name 
data_50 <- generate_data(50)

# see the data
data_50


## -----------------------------------------------------------------------------
# generate the data for n = 1000
data_100 <- generate_data(100)

# generate the data for n = 300
data_300 <- generate_data(300)

# generate the data for n = 500
data_500 <- generate_data(500)


## -----------------------------------------------------------------------------

# fit the model for n = 50
model_50 <- lm(y ~ x1 + x2, data = data_50)
summary(model_50)

# fit the model for n = 1000
model_100 <- lm(y ~ x1 + x2, data = data_100)
summary(model_100)

# fit the model for n = 300
model_300 <- lm(y ~ x1 + x2, data = data_300)
summary(model_300)

# fit the model for n = 500
model_500 <- lm(y ~ x1 + x2, data = data_500)
summary(model_500)


## -----------------------------------------------------------------------------
# get the estimated coefficients for n = 50
model_50$coefficients


## -----------------------------------------------------------------------------
# set the seed for reproducibility
set.seed(1238818)

# create an empty vector to save the results
beta_1_hat_50 <- c()

# generate the data for n = 50, 1000 times
for(i in 1:1000){
  # generate the data
  data_50 <- generate_data(50)
  
  # fit the model
  model_50 <- lm(y ~ x1 + x2, data = data_50)
  
  # save the results
  beta_1_hat_50[i] <- model_50$coefficients[2]
}




## -----------------------------------------------------------------------------
beta_1_hat_50 # there will be 1000 of the beta1hat from 1000 times repeated sampling


## -----------------------------------------------------------------------------
# plot the histogram of 1000s beta1hats
hist(beta_1_hat_50, breaks = 20)


## -----------------------------------------------------------------------------
# calculate the standard error
sd(beta_1_hat_50)


## -----------------------------------------------------------------------------

# set the seed for reproducibility
set.seed(1238818)

# create an empty vector to save the results
beta_1_hat_1000 <- c()

# generate the data for n = 500, 1000 times
for(i in 1:1000){
  # generate the data
  data_1000 <- generate_data(1000)
  
  # fit the model
  model_1000 <- lm(y ~ x1 + x2, data = data_1000)
  
  # save the results
  beta_1_hat_1000[i] <- model_1000$coefficients[2]
}



## -----------------------------------------------------------------------------
# calculate the standard error
sd(beta_1_hat_1000)


## -----------------------------------------------------------------------------

# plot the histogram for n = 50
hist(beta_1_hat_50, breaks = 10)

# plot the histogram for n = 1000
hist(beta_1_hat_1000, breaks = 200)



## -----------------------------------------------------------------------------

# fit the model
model_interaction <- lm(revenue ~ tv*newspaper, data = Showtime)

# view the results with stargazer package
library(stargazer)
stargazer(model_interaction, type = "text")


## -----------------------------------------------------------------------------
# load the library, load the data
library(readxl)
Auto <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/ps/04_mlr/Solutions/Auto.xlsx")



## -----------------------------------------------------------------------------
summary(Auto)


## -----------------------------------------------------------------------------

sort(Auto$horsepower)


## -----------------------------------------------------------------------------
# there are many ways also with a package dplyr, but here is a simple way to do this
Auto <-  Auto[Auto$horsepower != "?", ]


## -----------------------------------------------------------------------------
"134"
as.numeric("134")


## -----------------------------------------------------------------------------
Auto$horsepower <- as.numeric(Auto$horsepower)


## -----------------------------------------------------------------------------
summary(Auto)


## -----------------------------------------------------------------------------
plot(Auto$horsepower, Auto$mpg)



## -----------------------------------------------------------------------------
quad_fit <- lm(mpg ~ horsepower + I(horsepower^2), data = Auto)

library(stargazer)
stargazer(quad_fit, type = "text")



## -----------------------------------------------------------------------------
plot(Auto$horsepower, Auto$mpg)

lines(sort(Auto$horsepower), fitted(quad_fit)[order(Auto$horsepower)], col = "red", lwd = 2)




## -----------------------------------------------------------------------------
cubic_fit <- lm(mpg ~ horsepower + I(horsepower^2) + I(horsepower^3), data = Auto)
stargazer(cubic_fit, type = "text")


## -----------------------------------------------------------------------------
plot(Auto$horsepower, Auto$mpg)
lines(sort(Auto$horsepower), fitted(quad_fit)[order(Auto$horsepower)], col = "red", lwd = 2)
lines(sort(Auto$horsepower), fitted(cubic_fit)[order(Auto$horsepower)], col = "blue", lwd = 2)


## -----------------------------------------------------------------------------
poly_fit <- lm(mpg ~ poly(horsepower, 3, raw = TRUE ), data = Auto)

stargazer(poly_fit, type = "text")



## -----------------------------------------------------------------------------
Auto <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/ps/04_mlr/Solutions/Auto_clean.xlsx")



## -----------------------------------------------------------------------------
summary(Auto)



## -----------------------------------------------------------------------------
Auto$origin <- factor(Auto$origin, labels = c("USA", "Europe", "Japan"))
summary(Auto)



## -----------------------------------------------------------------------------
# without interaction
model1 <- lm(mpg ~ horsepower + origin, data = Auto)
summary(model1)

# with interaction
model2 <- lm(mpg ~ horsepower + origin + origin*horsepower, data = Auto)
summary(model2)



## ----include = FALSE----------------------------------------------------------
# You can ignore everything from here.... 
knitr::purl("PS-4_Soln.Rmd")

