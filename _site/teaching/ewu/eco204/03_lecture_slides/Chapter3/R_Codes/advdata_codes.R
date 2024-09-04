

## clear the env
rm(list = ls())


## set the directory
setwd("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/03_regression_slr/Codes/data_problems/advertising/")


# load the library, load the data
library(readxl)
Advertising <- read_excel("Advertising.xlsx")


# checking summary stats
summary(Advertising)

# create a scatter plot
plot(Advertising$TV, Advertising$sales)

# fit the model
slr_fit <- lm(sales ~ TV, data = Advertising)

# see the results
# to turn off scientific options(scipen = 999)
options(scipen = 999)
summary(slr_fit)


# plot the fitted line
plot(Advertising$TV, Advertising$sales)
abline(slr_fit)

## get an organized output
library(stargazer)
stargazer(slr_fit, type = "text")


# do anova table 
anova(slr_fit)


# fitted values
fitted(slr_fit)

# residuals
resid(slr_fit)

sum(resid(slr_fit))


#============= Prediction at test points

# point prediction
# 1a. point prediction for a single test point

# create test dataframe
test_data <- data.frame(TV = c(310))


# do point prediction / point estimate for a single test point
predict(slr_fit, test_data)

# 1b. point prediction for multiple test points, 

# create test dataframe
test_data <- data.frame(TV = c(310, 320))

# do point prediction /  point estimate for multiple test points
predict(slr_fit, test_data)


# 2. interval prediction for CEF at test points
predict(slr_fit, test_data, interval = "confidence")


# 3. interval prediction for Y at test points
predict(slr_fit, test_data, interval = "prediction")




#=========== plotting confidence intervals

# We will do it for training points
# but you can also do it for many test points.

# prediction on training points ( or points in the data set)
predict(slr_fit)

# plot the predicted points
plot(Advertising$TV, predict(slr_fit), cex = .2)

# confidence interval for mean on training points
predict(slr_fit, interval = "confidence")

confint_data <- predict(slr_fit, interval = "confidence")

# plotting the confidence interval

lines( sort(Advertising$TV), sort(confint_data[,2]) , col="blue", lty=1)
lines( sort(Advertising$TV), sort(confint_data[,3]) , col="blue", lty=1)


#===========  

# confidence interval for mean on training points
predict(slr_fit, interval = "prediction")

predint_data <- predict(slr_fit, interval = "prediction")

# plotting the confidence interval
lines( sort(Advertising$TV), sort(predint_data[,2]) , col="black", lty=1)
lines( sort(Advertising$TV), sort(predint_data[,3]) , col="black", lty=1)



# plotting everything together

plot(Advertising$TV, Advertising$sales)
abline(slr_fit, col = "red")
lines(sort(Advertising$TV), sort(confint_data[,2]) , col="blue", lty=1)
lines(sort(Advertising$TV),sort(confint_data[,3]) , col="blue", lty=1)
lines( sort(Advertising$TV), sort(predint_data[,2]) , col="black", lty=1)
lines( sort(Advertising$TV), sort(predint_data[,3]) , col="black", lty=1)
      