#Lesson 3-2
#Friday, 2/16/24

#Example 1
x <- seq(1,10)
median(x)
quantile(x,0.5)
mean(x,trim=0.5)

#Example 2
x <- 1:10
out <- summary(x)
out[2]
quantile(x,.25)

#What will give you the median?
#out[????]

#Let's look at out!
out
out[3]


#Load the data for today:
library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - StatewideBridges.xls")
View(bridges)

library(readxl)
bison <- read_excel("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - bison.xlsx")
View(bison)

#################################################

#1
Alamance <- bridges[bridges$COUNTY=="ALAMANCE",]
View(Alamance)  
  
#2  
Alamance2 <- bridges[c(1,149:1),]
Alamance3 <- bridges[1:149,]

head(Alamance2)
head(Alamance3)
tail(Alamance3)
dim(Alamance2)
dim(Alamance3)

#3
library(tidyverse)
Alamance4 <- filter(bridges,COUNTY=="ALAMANCE")



#Exercises
names(bridges)
table(bridges$STRUCTURALLYDEFICIENT)

exercise1 <- filter(bridges,STRUCTURALLYDEFICIENT=="SD")
table(exercise1$STRUCTURALLYDEFICIENT)

exercise2 <- filter(bridges,YEARBUILT < 2000)
max(exercise2$YEARBUILT)

exercise3 <- filter(bridges,COUNTY=="ALAMANCE",STRUCTURALLYDEFICIENT=="SD")
View(exercise3)
  

#Examples

Century_21 <- filter(bison,Yr >= 2000)

elk_na <- filter(bison,is.na(`Elk northern herd`))

AD_SD <- filter(bridges,COUNTY %in% c("ALAMANCE","DURHAM"),
                STRUCTURALLYDEFICIENT=="SD")
table(AD_SD$COUNTY)
table(AD_SD$STRUCTURALLYDEFICIENT)


AD_SD2 <- filter(bridges,COUNTY=="ALAMANCE" | COUNTY=="DURHAM",
                 STRUCTURALLYDEFICIENT != "N")
table(AD_SD2$COUNTY)
table(AD_SD2$STRUCTURALLYDEFICIENT)