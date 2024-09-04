## -----------------------------------------------------------------------------
rm(list = ls())


## -----------------------------------------------------------------------------
raw_data <- c(17, 21,  19,  23,  18, 16, 20, 18, 22, 20, 15, 22, 31, 34, 31, 33, 28, 32, 30, 29, 34, 33)

# here frequency is 1 since we observe the data in every week, we don't need to 
# set this but I did it just for clarity
gas_revised <- ts(raw_data, frequency = 1)

# "o" is used to show the circle in the plots
plot.ts(gas_revised , xlim = c(0, 22), ylim = c(0, 40), type = "o", 
        xlab = "Week", ylab = "Sales")



## -----------------------------------------------------------------------------
# This will creae a new object called gas_lag which is the lagged value of the gas_revised object
lag(gas_revised, k = -1)


## -----------------------------------------------------------------------------
cbind(gas_revised, lag(gas_revised, k = -1))


## -----------------------------------------------------------------------------

library(readxl)
raw_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/06_time_series/Codes/Gasoline.xlsx")

# take only the sales column and convert it to a time series object
gas_data <- ts(raw_data$Sales, frequency = 1)


# see the data
gas_data


## -----------------------------------------------------------------------------
plot.ts(gas_data, type = "o", xlab = "Week", ylab = "Sales")



## -----------------------------------------------------------------------------
# get the naive forecast
gas_forecast_naive <- lag(gas_data, k = -1)

# load the library forecast
library(forecast)

# get the summary measures for accuracy of the forecast
accuracy(gas_forecast_naive, gas_data)


## -----------------------------------------------------------------------------
# make a matrix of the forecast and the actual data
gas_forecast_naive_m <- cbind( gas_data, gas_forecast_naive)
gas_forecast_naive_m

# remove the NAs from the matrix
gas_forecast_naive_m <- na.omit(gas_forecast_naive_m)
gas_forecast_naive_m 

# plot the data
plot.ts(gas_forecast_naive_m,  plot.type = "single", xlab = "Week", ylab = "Sales", col = c("red", "blue"),  main = "Naive Forecast", type = "o", lwd = c(2, 1))

legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))



## -----------------------------------------------------------------------------
library(xts)
gas_ma <- rollmean(gas_data, k = 3,  align = "right", fill = NA)
gas_ma


## -----------------------------------------------------------------------------
cbind(gas_data, lag(gas_ma, k = -1))


## -----------------------------------------------------------------------------
# fix the lag
gas_forecast_ma <- lag(gas_ma, k = -1)

# get the summary measures for accuracy of the forecast
accuracy(gas_forecast_ma, gas_data)


## -----------------------------------------------------------------------------
# make a matrix of the forecast and the actual data
gas_forecast_ma_m <- cbind( gas_data, gas_forecast_ma)

# remove the NAs from the matrix
gas_forecast_ma_m <- na.omit(gas_forecast_ma_m)
gas_forecast_ma_m 

# plot the data
plot.ts(gas_forecast_ma_m,  plot.type = "single", xlab = "Week", ylab = "Sales", col = c("red", "blue"),  main = "MA Forecast (Equal Weights)", type = "o", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))



## -----------------------------------------------------------------------------

gas_ma_unequal <- rollapply(gas_data, width = 3, FUN = function(x){weighted.mean(x, w = c(1/6, 2/6, 3/6))}, align = "right", fill = NA)


gas_ma_unequal



## -----------------------------------------------------------------------------

accuracy(lag(gas_ma_unequal, k = -1), gas_data)



## -----------------------------------------------------------------------------
# make a matrix of the forecast and the actual data
gas_forecast_ma_unequal_m <- cbind( gas_data, lag(gas_ma_unequal, k = -1))

# remove the NAs from the matrix
gas_forecast_ma_unequal_m <- na.omit(gas_forecast_ma_unequal_m)
gas_forecast_ma_unequal_m

# plot the data
plot.ts(gas_forecast_ma_unequal_m,  plot.type = "single", xlab = "Week", ylab = "Sales", col = c("red", "blue"),  main = "MA Forecast (Unequal Weights)", type = "o", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))





## -----------------------------------------------------------------------------

raw_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/06_time_series/Codes/Bicycle.xlsx") 

bicycle_data <- ts(raw_data$Sales, frequency = 1)

plot.ts(bicycle_data, type = "o", xlab = "Year", ylab = "Sales")


## -----------------------------------------------------------------------------

bicycle_lm <- tslm(bicycle_data ~ trend)
summary(bicycle_lm)



## -----------------------------------------------------------------------------

bicycle_data_forecast_table <- forecast(bicycle_lm)

bicycle_data_forecast_table


# we only need the point forecast now
bicycle_data_forecast <- bicycle_data_forecast_table$fitted


## -----------------------------------------------------------------------------
accuracy(bicycle_data_forecast, bicycle_data)


## -----------------------------------------------------------------------------
bicycle_data_forecast_m <- cbind(bicycle_data, bicycle_data_forecast)
bicycle_data_forecast_m <- na.omit(bicycle_data_forecast_m)


plot.ts(bicycle_data_forecast_m , type = "o", plot.type = "single", xlab = "Year", ylab = "Sales", col = c("red", "blue"), main = "Linear Trend Forecast", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))




## -----------------------------------------------------------------------------

raw_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/06_time_series/Codes/Cholesterol.xlsx")

cholesterol_data <- ts(raw_data$Revenue , frequency = 1)

plot.ts(cholesterol_data, type = "o", xlab = "Year", ylab = "Cholesterol")

cholesterol_lm <- tslm(cholesterol_data ~ trend + I(trend^2))

summary(cholesterol_lm)

cholesterol_data_forecast_table <- forecast(cholesterol_lm)

cholesterol_data_forecast <- cholesterol_data_forecast_table$fitted

accuracy(cholesterol_data_forecast, cholesterol_data)



## -----------------------------------------------------------------------------
cholesterol_data_forecast_m <- cbind(cholesterol_data, cholesterol_data_forecast)
cholesterol_data_forecast_m <- na.omit(cholesterol_data_forecast_m)

cholesterol_data_forecast_m

plot.ts(cholesterol_data_forecast_m , type = "o", plot.type = "single", xlab = "Year", ylab = "Cholesterol", col = c("red", "blue"), main = "Quadratic Trend Forecast", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))




## -----------------------------------------------------------------------------

raw_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/06_time_series/Codes/Umbrella.xlsx")

# Note that we used frequency = 4 because the data is quarterly data.
umbrella_data <- ts(raw_data$Sales, frequency = 4, start = c(2018,1))

plot.ts(umbrella_data, type = "o", xlab = "Year", ylab = "Sales")


## -----------------------------------------------------------------------------
seasonaldummy(umbrella_data)


## -----------------------------------------------------------------------------
umbrella_lm <- tslm(umbrella_data ~ season)
summary(umbrella_lm)


## -----------------------------------------------------------------------------
Umrella_data_forecast_table <- forecast(umbrella_lm)


# we only need the point forecast now
Umrella_data_forecast <- Umrella_data_forecast_table$fitted

Umrella_data_forecast
accuracy(Umrella_data_forecast, umbrella_data)



## -----------------------------------------------------------------------------

# Nothing to omit here
Umrella_data_forecast_m <- cbind(umbrella_data, Umrella_data_forecast)

plot.ts(Umrella_data_forecast_m , type = "o", plot.type = "single", xlab = "Year", ylab = "Sales", col = c("red", "blue"), main = "Seasonal Trend Forecast", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))




## -----------------------------------------------------------------------------

raw_data <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/06_time_series/Codes/SmartphoneSales.xlsx")

smartphone_data <- ts(raw_data$`Sales (1000s)`, frequency = 4, start = c(1,1))
smartphone_data
plot.ts(smartphone_data, type = "o", xlab = "Year", ylab = "Sales")


## -----------------------------------------------------------------------------
smartphone_lm <- tslm(smartphone_data ~ trend + season)
summary(smartphone_lm)


## -----------------------------------------------------------------------------
smartphone_data_forecast_table <- forecast(smartphone_lm)

# we only need the point forecast now
smartphone_data_forecast <- smartphone_data_forecast_table$fitted

smartphone_data_forecast

accuracy(smartphone_data_forecast, smartphone_data)



## -----------------------------------------------------------------------------

# Nothing to omit here
smartphone_data_forecast_m <- cbind(smartphone_data, smartphone_data_forecast)

plot.ts(smartphone_data_forecast_m , type = "o", plot.type = "single", xlab = "Year", ylab = "Sales", col = c("red", "blue"), main = "Seasonal Trend Forecast", lwd = c(2, 1))
legend("topleft", legend=c("Actual", "Forecast"),col=c("red", "blue"), cex=0.8, lwd = c(2, 1))




## ----include = FALSE----------------------------------------------------------
# export R codes
knitr::purl("ts_lab.Rmd", documentation = 1)

