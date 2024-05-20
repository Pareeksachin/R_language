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



################################ Histogram #################################################
## data & Aesthetics
pl <- ggplot(movies,aes(x = rating))

# geometry layer
pl2 <- pl+geom_histogram(binwidth = 0.1,color='red',fill='pink',alpha=0.4)
#or
pl2 <- pl+geom_histogram(binwidth = 0.1,aes(fill = ..count..)) # aesthetic colour
# alpha is for transparancy
pl3 <- pl2 + xlab("Movie Rating")+ylab('Count')

print(pl3 + ggtitle("Histogram"))


################################ Scatter plot #########################################################
df <- mtcars

#data & aesthetics layer

pl <- ggplot(df,aes(x=wt,y=mpg))

pl2 <- pl + geom_point(alpha=0.5,size = 5)
#OR
pl2 <- pl + geom_point(aes(shape = factor(cyl),color= factor(cyl)),size = 3)
# using size for a discreate variable is not advised so we have to use "shape"
#Or
pl2 <- pl + geom_point(aes(color = hp),size = 3)
# now we want to set low colour or high colour for plot
pl3 <- pl2 + scale_color_gradient(low = 'blue',high = 'red')
print(pl3)



################################# Barplots ############################################################# 
#barplots : shows relation between a numeric and a categorical variable
df <- mpg

pl <- ggplot(df , aes(x = class))
print(pl+geom_bar(aes(fill = drv),position = 'dodge'))
# position is for different stacking or diff bars ( usually used for compare groups)


################################ Boxplots #################################################################
# uses boxes and lines to depict the distributions of one or more groups of numeric data

df <- mtcars

pl <- ggplot(df,aes(x=factor(cyl),y=mpg))
pl2 <- pl+geom_boxplot(aes(fill = factor(cyl))+theme_bw())
print(pl2)
## coord_flip() : flipping the coordinates

######### 2 variable plotting
library(ggplot2movies)

pl <- ggplot(movies,aes(x = year,y=rating))
pl2 <- pl+geom_bin2d()+ scale_fill_gradient(high = 'red',low = 'green')
print(pl2)


install.packages('hexbin')
pl <- ggplot(movies,aes(x = year,y=rating))
pl2 <- pl+geom_hex()
print(pl2+ scale_fill_gradient(high = 'red',low='blue'))


# 2d density plot
pl2 <- pl + geom_density2d()
print(pl2)


### Cordinates and faceting

pl <- ggplot(mpg,aes(x = displ,y = hwy))+geom_point()

pl2 <- pl + coord_cartesian(xlim = c(1,4),ylim = c(15,30))

# coord_fixed

pl2 <- pl + coord_fixed(ratio = 1/3)

print(pl2)


#help('facet_grid')

#facit grid
print(pl + facet_grid(.~cyl))

print(pl + facet_grid(drv ~cyl)) ## 2 dimensions of facet

print(pl+facet_grid(drv ~.))


#### Themes


## applying a theme
#theme_set(theme_minimal())
pl <- ggplot(mtcars,aes(x = wt,y=mpg))+geom_point()
print(pl +theme_dark())
## 2 methods are defined above

