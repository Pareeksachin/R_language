setwd("/home/auriga/Documents/R/Datasets")

A <- c(10,20,30,40,89,67)
barplot(A)

cars93 <- read.csv("Cars93.csv")
table(cars93$Type)

cars93$Type

cars93$Price.Category
table(cars93$Price.Category)

barplot(table(cars93$Price.Category))
barplot(table(cars93$Type),main = "Types of Cars",col = "mistyrose2")
## it will show all colour options
colors()

hist(cars93$Price,main = "Prices ")
## scatter plot
plot(cars93$Price,cars93$MPG.city,xlab = "price",ylab = "Milage in city ",main = "Price Vs MPG")

gesoline <- read.csv("Gasoline.csv")
boxplot(cars93$Price)
boxplot(cars93$Price ~ cars93$Type)


############### ggplot 

## data visualization layers :
# Data
#aesthetics
#geometrics
#facets
#statistics
#coordinates


library(ggplot2)
install.packages('ggplot2movies')

library(ggplot2movies)
movies

## data & Aesthetics
ggplot(movies,aes())

