

## setting the directory
setwd("C:\\Users\\ASUS\\Dropbox\\Shared_wih_Towsif\\eco204\\projects\\project_formatting\\Tex\\R_Example")

library(readxl)
armands <- read_excel("armands.xlsx")


# restaurant is a factor variable
armands$Restaurant <- factor(armands$Restaurant)


# let's print some summary stats
# install.packages("vtable")
# install.packages("xtable")

library(vtable)
library(xtable)



sumtable(armands)


# print latex table
sumtable(armands, out = 'latex')



# Now what about scatter plot 

plot(armands$Population, armands$Sales,
     xlab = "Population",
     ylab = "Sales",
     cex = 1.5,
     pch = 20,
     col = "blue")


# To get the regression results, 

fit1 <- lm(Sales ~ Population, data = armands)


library(stargazer)
stargazer(fit1, type = "text")
stargazer(fit1, type = "latex")


stargazer(armands)

