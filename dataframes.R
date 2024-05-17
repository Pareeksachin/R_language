days <- c('MOn','Tue','wed','Thur','Fri')
temp <- c(22,21,24,27,29)
rain <- c(T,T,F,F,T)
df <- data.frame(days,temp,rain)
df


## indexing and selection
df[1,]
df[1,2]
df[,'rain']

df[1:5,c('days','temp')]


df$days
df['days']

## condition days where rain == true

subset(df,subset= rain==TRUE)
subset(df,subset = temp>23)

## ordering data frames

sorted.temp <- order(df['temp']) #sorted temp thorugh index
sorted.temp

df[sorted.temp,]

## sort decending order

desc.temp <- order(-df['temp'])
df[desc.temp,]


### overview of dataframes

# empty data frames
empty <- data.frame()
empty
c1 <- 1:10
letters
c2 <- letters[1:10]

df <- data.frame(data= c1,ltr = c2) 
df


## import and export csv files

# to read csv files

d2 <- read.csv('aaaa.csv')
## write csv
write.csv(df,file = "dummydata.csv")
dum <- read.csv('dummydata.csv')
dum


## reference a particular cells 
df[[2,2]]


