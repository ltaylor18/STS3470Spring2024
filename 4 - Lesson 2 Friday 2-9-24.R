#Lesson 2 - Friday 2-9-24

#Code from notes:

View(Loblolly)
?Loblolly
head(Loblolly)
dim(Loblolly) 
str(Loblolly)
data.frame(Loblolly)
Loblolly$height

max(Loblolly$height)
#For curiosity:
max(Loblolly)

age5 <- filter(Loblolly,age==5)

#Note: I originally had planned for us to download this package on day 1,
#since we didn't do that we need to do it together now!
library(tidyverse)
age5 <- filter(Loblolly,age==5) 
age5
View(age5)


#Use the max() function to find the tallest 5 year old Loblolly pine in data.
max(age5$height)

#Use the mean() function to find the mean height of 5 year old Loblollies in data.
mean(age5$height)

#Alternatively
age5_alt <- Loblolly[Loblolly$age==5,]

max(age5_alt$height)
mean(age5_alt$height)
Loblolly[[1]]
Loblolly[1]
is.vector(Loblolly[[1]])
is.vector(Loblolly[1])
is.data.frame(Loblolly[1])
Loblolly[1:2,]
Loblolly[,2]


myvec <- c(5,"Laura",7.9)
myvec

