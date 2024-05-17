setwd("/home/auriga/Documents/R/Datasets")

cars <- read.csv("Cars93.csv")

cars


dim(cars)
str(cars)

autocoll1 <- read.csv("AutoCollision.csv")
str(autocoll1)
autocall <- read.csv("AutoCollision.csv",stringsAsFactors = TRUE)
str(auto)

#auto$Age <- factor(auto$Age)
rm(list = ls())

bollywd <- read.csv("Bollywood_2015_2.csv",header = F)
dim(bollywd)
colnames(bollywd)<- c("Movie","BO","Budget","Verdict")
bollywd

diamonds <- read.csv2("Diamonds.csv")
diamonds

diamonds <- read.csv("Diamonds.csv",sep = ";",dec = ",")

mem <- read.csv("members.txt",header = T, sep = "",skip = 1)
mem


### reading excel file 

install.packages("readxl")
library(readxl)


brupt <- read_excel("bankruptcy.xlsx",sheet = "data")

qual1 <- read_excel("quality.xlsx",sheet = "quality",range = "A1:D6")
qual2 <- read_excel("quality.xlsx",sheet = "quality",range = "H1:J16")
write.csv(qual2,"qual2.csv",row.names = F)



### subsetting the data frame
auto[5,]
auto[1:5,]


ss_cars <- subset(cars,Type=='Small' & Price >20, select = c(Manufacturer,Price,Model,Origin))
ss_cars


### tidyverse
install.packages("tidyverse")
library(tidyverse)

install.packages(c("curl","httr","googledrive","googlesheets4"))


install.packages(c("systemfonts", "haven", "xml2", "textshaping", "rvest", "ragg", "tidyverse"))

install.packages("tidyverse")


library("tidyverse")
install.packages('nycflights13',dependencies = TRUE)


install.packages(c("textshaping", "ragg", "tidyverse"))


install.packages("tidyverse")
install.packages("ragg")



####

data('mtcars')
write.csv(mtcars,"mtcars.csv")


ss_mtcars <- mtcars[c(2,18,30,12),]

class(mtcars)

ss_mtcars


tbl_mtcars <- as_tibble(mtcars)
tbl_mtcars
class(tbl_mtcars)

library(tidyverse)

auto <- read.csv("AutoCollision.csv")
s_autoc <- arrange(auto, Claim_Count)
s_autoc
s_autoc <- arrange(auto,desc(Claim_Count))
s_autoc

### magritrr

s_autoc <- auto %>% arrange(Claim_Count)
s_autoc

library(dplyr)

s_autoc <- auto %>% arrange(Claim_Count)
s_autoc



######## 

a <- c(NA,34,78,12)
mean(a,na.rm=TRUE)

## renaming a column 
cars = rename(cars,Minimum = Min.Price) 