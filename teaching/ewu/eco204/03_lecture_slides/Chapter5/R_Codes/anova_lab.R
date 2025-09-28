## -----------------------------------------------------------------------------
rm(list = ls())


## -----------------------------------------------------------------------------
library(readxl)
# Load the data
data1 <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/05_anova/Codes/service_data_1.xlsx")

# this data is in wide format
# look at the column names
data1


## -----------------------------------------------------------------------------

# load the tidyr package
library(tidyr)

# reshape the data to long format
data1_long <- pivot_longer(data1, cols = 1:3, names_to = c("service"), values_to = c("score"))



## -----------------------------------------------------------------------------
data1_long


## -----------------------------------------------------------------------------
# convert the service to factor
data1_long$service <- as.factor(data1_long$service)


# check the summary stats
summary(data1_long)



## -----------------------------------------------------------------------------
# now we are ready to run anova
anova_result1 <- aov(score ~ service, data =data1_long)
summary(anova_result1)



## -----------------------------------------------------------------------------
# Load the data
data2 <- read_excel("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/05_anova/Codes/service_data_2.xlsx")

# look at the column names
names(data2)


## -----------------------------------------------------------------------------
# reshape from wide to long, we will use pivot_longer from tidyr package
data2_long <- pivot_longer(data2, cols = starts_with("Service"), names_to = c("service"), values_to = c("score"))


# rename the columns
names(data2_long) <- c("student", "service", "score")

# convert the service and stduent variable to factor
data2_long$service <- as.factor(data2_long$service)
data2_long$student <- as.factor(data2_long$student)

summary(data2_long)


## -----------------------------------------------------------------------------

anova_result2 <- aov(score ~ service + student , data = data2_long)
summary(anova_result2)



## -----------------------------------------------------------------------------
lm_result <- lm(score ~ service + student , data = data2_long)

summary(lm_result)

# in this case the anova function will give you the same result as the aov function
anova(lm_result)


## ----include = FALSE----------------------------------------------------------
knitr::purl("anova_lab.Rmd")

