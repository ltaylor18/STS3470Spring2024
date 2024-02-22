#8 - Monday, 2/19/24
#Lesson 3-2 continued


#Updates to Moodle page!

library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2024/Previous Data Files/Lesson 3 - StatewideBridges.xls")
View(bridges)

library(tidyverse) #library(dplyr)

summarize(bridges,min(YEARBUILT)) #shows the oldest bridge in NC
NCCounties <- group_by(bridges,COUNTY)
summarize(NCCounties,min(YEARBUILT)) #shows the oldest bridge in NC for each county

summarize(ungroup(NCCounties),min(YEARBUILT))

str(NCCounties)

#Creating new variables
bridges <- mutate(bridges,age=2023-YEARBUILT)
bridges$age2 <- 2023 - bridges$YEARBUILT

#Lesson 3 - Activity 1

library(dplyr)
data(mtcars)
mtcars2 <- mtcars
?mtcars

summary(mtcars2) #base
summarize(mtcars2) #dplyr
summarise(mtcars2) #dplyr

summary(mtcars$mpg)
summarize(mtcars2,mymean=mean(mpg)) #dplyr

#4
summarize(mtcars2,mysd=sd(mpg))

#5
summarize(mtcars2,min(mpg),quantile(mpg,.25),median(mpg),mean(mpg),quantile(mpg,.75),max(mpg)) 
#That was painful to type it all! Don't you agree?

#6
auto <- filter(mtcars2,am==0)
manual <- filter(mtcars2,am==1)
View(auto)
View(manual)

#7
summarize(mtcars2,n())
summarize(auto,n())
summarize(manual,n())

#8
example <- filter(mtcars2,hp < 150)
arrange(example,hp)
View(example)

#9
example <- arrange(example,hp)
example[1,]
example <- arrange(example,desc(hp))
example[1,]
summarize(example,min(hp),max(hp))

#10
names(mtcars2)
example2 <- filter(mtcars2,gear < 4 & carb == 1)

#11
example3 <- filter(mtcars2,gear < 4 | carb == 1)

#12
length(example2$mpg) #I just picked a random variable!
summarize(example2,n())

length(example3$mpg) 
summarize(example3,n())
#TRUE!
# The data set resulting from & (and) will always have either 
# the same number of observations as resulting from I (or) 
# or will have fewer. 

#13
filter(mtcars2,cyl %in% c(4,8))
#Alternatively, you could have used:
filter(mtcars2,cyl==4 | cyl==8)

#14
#Make another copy of mtcars!
mtcars3 <- mtcars
group_by(mtcars3,gear) #A - seems like this should group by gear
View(mtcars3) #B - it doesn't look different
summarize(mtcars3,mean1=mean(mpg)) #C - this still gives us the overall mean!

#15
mymtcars <- group_by(mtcars3,gear)
View(mymtcars) # it doesn't look different!
summarize(mymtcars,mean1=mean(mpg)) # but the summarize reports the mean for 
#each level of the variable mpg!


#16
ungroup(mymtcars)
summarize(mymtcars,mean=mean(hp))
#we didn't store the ungrouped data into a new object, so the
#ungrouping was implemented for that one line of code only

#17
mymtcars <- ungroup(mymtcars) #store the ungrouped data into an object!
summarize(mymtcars,mean=mean(hp))

#18
mtcars2$mpquart <- mtcars2$mpg/4 #base
mtcars2 <- mutate(mtcars2,mpquart2 = mpg/4) #dplyr

#I think that both are helpful to know, I don't have a strong
#preference for one over the other. However, with mutate, you
#could actually make multiple variable changes in a single line of
#code. That is nice!



#Examples in notes using the piping operator (%>%)
Loblolly %>% group_by(age) %>% summarize(mean(height))
#same as:
summarize(group_by(Loblolly,age),mean(height))
#same as:
Loblolly2 <- group_by(Loblolly,age)
summarize(Loblolly2,mean(height))


