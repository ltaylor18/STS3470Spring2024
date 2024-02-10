#Lesson 2 - Activity 1
#National Yoyo contest data

#1
library(readxl)
yoyo <- read_excel("C:/Users/ltaylor18/Downloads/NationalYoYoContest2023Finals.xlsx")
View(yoyo)

head(yoyo)

#2
str(yoyo)
dim(yoyo)
is.matrix(yoyo)
is.data.frame(yoyo)
summary(yoyo)
min(yoyo$discard_deduction)
names(yoyo)


#3
PlayerNames <- yoyo[,2]

#4
penalty <- yoyo$stop_deduction + yoyo$discard_deduction + yoyo$detach_deduction
penalty
