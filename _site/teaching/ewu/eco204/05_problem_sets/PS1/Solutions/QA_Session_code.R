


# Chapter 8.1 , Problem 7

# clear the env

# a.
n <- 50
sigma <- 255
sderror <- sigma / sqrt(n)
alpha <- 0.05

moe <- qnorm(1 - alpha/2) * sderror 

moe

#b.

xbar <- 1836.84

lcl <- xbar - moe
ucl <- xbar + moe

c(lcl, ucl)


# if we do the whole calculation in R

setwd("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/Books/DataSets/Anderson/Chapter 08/")

# change the directory and import the data in R
# then do 

data <- Setters$`Cost ($)`

data

xbar <- mean(data)

