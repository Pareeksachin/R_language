setwd("/home/auriga/Documents/R/Datasets")

cars93 <- read.csv("Cars93.csv")

library(dplyr)

# check columns names
colnames(cars93)

# rename a column
cars93_1 <- rename(cars93,Minimum = Min.Price) 


## adding a new column to a df
cars93$range = cars93$Max.Price - cars93$Min.Price
#OR
cars93_2 <- mutate(cars93,range = Max.Price - Min.Price)
cars93_2


mean(cars93$Price,na.rm = T)

summarise(cars93,avg_price = mean(Price,na.rm = T),sd_price = sd(Price,na.rm = T))

grp_cars93 <- group_by(cars93,Type)

summarise(grp_cars93,avg_price = mean(Price,na.rm = T),sd_price = sd(Price,na.rm = T))


# do it in more concise way
cars93 %>% group_by(Type)%>% summarise(avg_price = mean(Price,na.rm = T), sd_price = sd(Price,na.rm = T))


## exercises 

survey <- read.csv("survey.csv",stringsAsFactors = T)

MaleNonSmoker <- filter(survey, Sex=="Male"& Smoke == "Never")
MaleNonSmoker

PulseGT80 <- survey %>% filter(Pulse >80) %>% select(Sex,Exer,Smoke,Pulse)

## check unique values in a column
un_col <- survey%>% distinct(Smoke)
un_col

## check column is avilabel or not in the dataframe
any(names(survey)=="Sex")

RtHand <- survey %>% mutate(Ratio_Hnd = Wr.Hnd/NW.Hnd) %>% select(Ratio_Hnd,Clap,Age)
RtHand


DescStats <- survey %>% summarise(avg_age = mean(Age,na.rm = T),sd_age = sd(Age,na.rm = T))
DescStats

DescGrp <- survey %>% group_by(Sex) %>% summarise(avg_age = mean(Age,na.rm = T),ad_age = sd(Age,na.rm = T))
DescGrp


############# 

orders = read.csv("Orders.csv")
ord_det <- read.csv("Ord_Details.csv")

orders
ord_det

df <- inner_join(orders,ord_det,by="Order.ID")
df

items <- read.csv("Items.csv")
combo_df <- inner_join(items,df,by=Item.ID)
##OR

combo_df <- orders %>% inner_join(ord_det,by = "Order.ID") %>% inner_join(items, by= "Item.ID")
combo_df


######################

courses <- read.csv("Courses.csv")
sched <- read.csv("CourseSchedule.csv")

colnames(sched)
colnames(courses)

all_data <- sched %>% rename(CourseID=CourseCode) %>% inner_join(courses,by = "CourseID")
all_data

############ tidyrrrr

library(tidyr)

## Gather() : convert wide format data in to long format data
data <- data.frame(id = 1:3, year_2022 = c(10,20,30),year_2023 = c(15,25,35))
data

long_data <- gather(data,year,value,year_2022:year_2023)
long_data

## speard() : to convert long format data to wide format data

long_data <- data.frame(id = 1:3, year= c("2000","2001") ,value= c(10,20,30,15,25,35))
wide_data <- spread(long_data,year,value)
wide_data

## seprarate() :to separate one column into multiple columns
data <- data.frame(name = c("Sachin_Pareek","Punit_Pareek"),age = c(25,30))

separate_data <- separate(data,name,into = c("First_name","Last_name"),sep = "_")
separate_data

### unite() : to unite multiple columns in to a single column
## unite(data,col,sep="",remove=True,na.rm = FALSE)

data <- data.frame(first_name = c("Sachin","Anil"),last_name = c("Pareek","Bharti"),age = c(24,30))
unite_data <- unite(data,name,first_name,last_name,sep = "_")
unite_data

## pivot_longer() : to pivot data from wide to long format. it supersedes gather()
## usage: pivot_longer(data,cols,names_to,values_to)

data <- data.frame(id = 1:3,year2000 = c(10,20,30),year2003 = c(40,12,34))
longer_data <- pivot_longer(data,cols = starts_with("year"),names_to = "year",values_to = "value")
longer_data

table4a

gather(table4a,'1999','2000',key = 'year',value = 'cases')


##or 
table4a %>% gather('1999','2000',key = 'year',value = 'cases')
table4a

##or 
table4a %>% gather(-country,key='year',value='cases')


#### Exercise 
comb1 <- read.csv("comb1.csv")
lng_combo1 <- comb1 %>% pivot_longer(-c(District),names_to = "ItemType",values_to = 'qty')
lng_combo1


### exercise2

comb2 <-read.csv("comb2.csv")
sep_comb2 <- comb2 %>% separate(PatientID,into = c("projectID","SiteID","PatientNumber"),sep="[-/]")
sep_comb2



#### XML ####################################

library(xml2)

filePath = "foods.xml"
document <- read_xml(filePath)

### get the root node
rootNode <- xml_root(document)
### display the name of the root node

root_name <- xml_name(rootNode)
root_name

##display the names of the children nodes 
child_nodes <- xml_children(rootNode)

child_nodes

names(rootNode)
class(rootNode)


######################## JSON

library(jsonlite)
jsonData <- fromJSON("contacts.txt")
jsonData

class(jsonData)
names(jsonData)

# nested objects

jsonData$phoneNumber
class(jsonData$phoneNumber)
jsonData$phoneNumber$number

## converting data frmes into JSON
mt_JSON <- toJSON(mtcars)
mt_JSON

