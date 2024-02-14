#Lesson 3-1 Continued
#Wednesday, 2/14/24

#Check out the new newsletter format!

#Reminder about the statistics senior comprehensive evaluation meeting!
#We will be holding a help session regarding the Senior Comprehensive Evaluation 
#requirements on February 14 from 4:15-5 PM in Duke 203.

#A special surprise:
dat<- data.frame(t=seq(0, 2*pi, by=0.01) )

xhrt<- function(t) 16*sin(t)^3

yhrt<- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)

dat$y=yhrt(dat$t)

dat$x=xhrt(dat$t)
with(dat, plot(x,y, type="l", axes=FALSE, frame.plot=FALSE, xlab = '', ylab = ''))

with(dat, polygon(x,y, col="#FF7575"))

title("Happy Valentine's Day!")


library(readr)
twilight <- read_table("C:/Users/ltaylor18/Downloads/Lesson 3 - Age Data.txt", 
                       comment = "!")
is.data.frame(twilight)


str(twilight)
is.tibble(twilight)
library(tibble)
is_tibble(twilight)


library(readr)
temp <- read_csv("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - Temperature Anomalies.txt")
View(temp)


library(readxl)
bison <- read_excel("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - bison.xlsx")
View(bison)

names(bison)
bison$`Northern herd spring calf ratio`

View(bison)
summary(bison)



##########Lesson 3 - Activity 1#############

#1
library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - StatewideBridges.xls")
View(bridges)

#2
summary(bridges)
min(bridges$YEARBUILT)

#3
hist(bridges$YEARBUILT)

#4
Alamance <- bridges[bridges$COUNTY=="ALAMANCE",]

#4a.
#Alamance <- bridges[bridges$COUNTY=="Alamance",] #does not work!

#4b.
length(Alamance$COUNTY)

#4c.
min(Alamance$YEARBUILT)

#4d.
max(Alamance$YEARBUILT)

#4e.
table(Alamance$STRUCTURALLYDEFICIENT)

#5
library(tidyverse)
Alamance2 <- filter(bridges,COUNTY=="ALAMANCE")
View(Alamance2)
