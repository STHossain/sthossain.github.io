
## clean the env


### vectors, data, matrices, subsetting

x = c(2, 7, 5)

x

y = seq(from = 4, length = 3, by = 3)

?seq

y 

x + y

x / y

x * y

x^y

x[2]

x[2:3]

x[-2]

x[-c(1, 2)]

z = matrix(seq(1, 12), 4, 3)

z[, 2:3]

z[, 1]

z[, 1, drop = FALSE]

ls()

## Generating random data, graphics

x = runif(50)
y =  rnorm(50)
plot(x, y)

plot(x, y, xlab = "Random Uniform", ylab = "Random Normal", pch = "*", col = "blue")

par(mfrow = c(2, 1))
plot(x,y)
hist(y)

par(mfrow = c(1, 1))

### Reading in data
Auto <- read.csv("/home/tanvir/Documents/ownCloud/Git_Repos/EWU_repos/3_Fall_2023/eco_204/ewu-eco204.github.io/pdf_files/slides/03_regression/ISLR/RCodes/data/Auto.csv")

names(Auto)

dim(Auto)

class(Auto)

summary(Auto)

plot(Auto$cylinders, Auto$mpg)

attach(Auto)

search()

plot(cylinders, mpg)

cylinders = as.factor(cylinders)

plot(cylinders, mpg)

