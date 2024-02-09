#Lesson 2 - Friday 2-9-24

#Code from notes:

View(Loblolly)
?Loblolly
Head(Loblolly)
dim(Loblolly) 
str(Loblolly)
data.frame(Loblolly)
Loblolly$height
max(Loblolly$height)

age5 <- filter(Loblolly,age==5)

#Note: I originally had planned for us to download this package on day 1,
#since we didn't do that we need to do it together now!
library(tidyverse)
age5 <- filter(Loblolly,age==5) 


#Use the max() function to find the tallest 5 year old Loblolly pine in data.

#Use the mean() function to find the mean height of 5 year old Loblollies in data.


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
