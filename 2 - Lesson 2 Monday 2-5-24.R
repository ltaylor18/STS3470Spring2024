#Lesson 2 Notes
#2/5/2024

statement <- "Hello World!"
height <- 72
mylogic <- TRUE
mylogic2 <- "TRUE"

length(statement)
is.character(statement)
is.character(mylogic2)
is.logical(mylogic)
sum(mylogic)

is.logical(mylogic2)
#is.scalar does not exist!

mylogic3 <- true #think about it before running it!


name <- "Laura"
name2 = "Laura"

#############VECTORS

myname <- c("Laura","Taylor")
counting <- 1:10
odds <- seq(1,10,2)
myrep <- rep("Taylor Swift",3)
mygrades <- c(95,89,100)

myname
counting
odds
myrep
mygrades



###############################
##Example #1 - For you to try
###############################

a <- c(11,13,15,1,9,7,7,10)
b <- seq(5,10,1)

a[3]
a[1] <- 8
a

#prints the second element of the b vector
b[2]

a[3:6]
subset <- a[3:6]
subset


a[c(1,5,7)]

3:10

seq(3,10)
seq(3,10,2)
a[-3]
x <- rep(4,10)
x

is.numeric(x)
is.character(x)
is.logical(x)
is.vector(x)