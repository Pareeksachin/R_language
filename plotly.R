install.packages('plotly')


## we can convery ggplot2 charts in to plotly
## the plotly R Package serializes ggplot2  figures into plotly's universal graph JSON. plotly :: ggplotly will crawal  the ggplot2 figure 
## extract and transalte all of the attributes of the ggplot2 figure into JSON ( colors,axes,chart type) and draw the graph with plotly.js

## install the latest development version via devtools


 install.packages('devtools')
 devtools::install_github("ropensci/plotly")
 
 
 library(plotly)

set.seed(100) ## sets the seed fo rrandom number generation to sensure reproducitbility. this means that random number sampling
# peformed will be the same every time you run the code

nrow(diamonds)
 d <- diamonds[sample(nrow(diamonds),1000),]
d 


p <- ggplot(data = d,aes(x = "caret",y = "price")) + geom_point(aes(text = paste("Clarity :",clarity))) +geom_smooth(aes(colour = cut,fill = cut))+facet_wrap(~cut)

ggplotly(p)



####################################
library(ggplot2)
library(tidyverse)
theme_set(theme_bw())


## dumbbell plot : using geom_line() and geom_point()
gapminder <- read_csv("https://raw.githubusercontent.com/datavizpyr/data/master/gapminder-FiveYearData.csv")

df <- gapminder %>% filter(year %in% c(1952,2007)) %>% filter(continent == "Asia" )

#df <- df %>% mutate(paired = rep()) 
