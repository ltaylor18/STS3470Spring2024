#Lesson 3-1
#Monday, February 12, 2024

library(readr)
twilight <- read_table("C:/Users/ltaylor18/Downloads/Lesson 3 - Age Data.txt", 
                       comment = "!")
View(twilight)

is.data.frame(twilight)
names(twilight)



library(readr)
twilight <- read_table("C:/Users/ltaylor18/Downloads/Lesson 3 - Age Data.txt",  comment = "!")