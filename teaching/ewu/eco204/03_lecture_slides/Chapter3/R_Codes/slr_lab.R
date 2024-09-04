

rm(list = ls())


## change the working directory
setwd("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/lab_files/slr/data/")



# load the library for reading the excel file
library(readxl)

# load the data set
boston <- read_excel("Boston.xlsx")


## see the data
boston


## summary stats of boston data
summary(boston)


## plot lstat vs medv
plot(boston$lstat, boston$medv)


## correlation of lstat and medv
cor(boston$lstat, boston$medv)


## slr fit
model_fit <- lm(medv ~ lstat, data = boston)


## get the results of model fit
summary(model_fit)


## plot the fitted line
plot(boston$lstat, boston$medv)
abline(model_fit)


##  significance testing using t-test

# calculate t calc
tcalc <- (-0.95 - 0)/0.03873
tcalc


## getting critical values
alpha <- 0.05
n <- nrow(boston)
n
qt(1 - alpha/2, n - 2)
qt(alpha/2, n - 2)


## getting p values
abs_tcalc <-abs(tcalc) 
pvalue <- 2 * (1-pt(abs_tcalc, n - 2))
pvalue


## stop scientific printing
options(scipen = 999)


## check the summary of model fit again
summary(model_fit)


## print ANOVA table
anova(model_fit)


## Residual plot 
plot(boston$lstat,  residuals(model_fit))

