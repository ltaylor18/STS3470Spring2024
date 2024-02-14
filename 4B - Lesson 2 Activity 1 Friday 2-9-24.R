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
is.vector(penalty) #turns out it is a data frame...oops! :)

#5
# pe_Score = execution, control, trick_diversity, space_use, choreography, construction, body_control, and showmanship
pe_score = yoyo$execution + 
  yoyo$control +
  yoyo$trick_diversity + 
  yoyo$space_use + 
  yoyo$choreography + 
  yoyo$construction + 
  yoyo$body_control + 
  yoyo$showmanship

#verify:
pe_score[1]

#6
scores <- cbind(yoyo$total_te,pe_score,penalty)
is.matrix(scores)
is.numeric(scores)


#7
?apply
final_score <- apply(scores,1,sum) #1 = apply the sum to the rows!
length(final_score)

#8
scores <- cbind(scores,final_score)

#9
yoyo2023 <- data.frame(PlayerNames,scores)
is.data.frame(yoyo2023)
head(yoyo2023)

#10
library(tidyverse)

#11
yoyo2023 <- arrange(yoyo2023,desc(final_score))

#12
head(yoyo2023,1)
yoyo2023[1,]

#13
yoyo2023[1,1]

#14
yoyo2023[1,c(1,5)]
