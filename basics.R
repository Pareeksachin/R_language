x = 19 
print(class(x))
# change values of a variables
msg = "hello sachin"
print(msg)
msg <- "error found"
print(msg)

msg <- "hey"
print(msg)

library()


a <- 8 
b <- function() a
c <- function(){
  a<-9
  b()
}
cat(a,b(),c())

f <- NA
is.na(f)

mat <-matrix(10,3,2)
mat


## factors 

# create a vactor of grades
grades <- c("A","B","A","A","B","C")

#convert grades vector to factor 
grade_factor <- factor(grades)

print(grade_factor)

summary(grade_factor)


## list

## creating a list with vector,matrixs, list 
lst <- list(
  c("Sachin", "punit", "bharat"),
  matrix(c(10, 20, 30, 60, 50, 80), nrow = 2),
  list("BTech", "BCA", "MBBS")
)

names(lst)<-c("Students","marks","course")


ls()
search()

# remove objects from r env
rm(list=ls())


lst
lst[2]


e_list <- list(2,4,6,8)
o_list <- list(1,3,5,7)
merged.list <- list(e_list,o_list)
print(merged.list)

## list to vector

lst1 <- list(10:20)
lst2 <- list(5:14)

v1 <- unlist(lst1)
v2 <- unlist(lst2)

print(v1)
print(v2)


## dataframe
a <- c(10,20,30,40)
b <- c("X","y","z","A")
df <- data.frame(a,b)
df


