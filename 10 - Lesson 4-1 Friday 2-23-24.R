#10 - Lesson 4-1 continued
#Friday, 2/23/24

library(tidyverse) #library(ggplot2)

#Scatterplot
ggplot(starwars,aes(x=height,y=mass)) + 
  geom_point(shape=13,size=5,color="purple")

#Boxplot
ggplot(starwars,aes(x=height)) + geom_boxplot()

filter(starwars,species %in% c("Human","Droid")) %>%
  ggplot(aes(x=species,y=height)) +
  geom_boxplot()

ggplot(starwars,aes(x=species,y=height))+
  geom_boxplot()

#Histogram
ggplot(starwars,aes(x=height)) + geom_histogram()
ggplot(starwars,aes(x=height)) + 
  geom_histogram(bins=30,color="blue")
ggplot(starwars,aes(x=height)) + 
  geom_histogram(bins=20,color="white")
ggplot(starwars,aes(x=height)) + 
  geom_histogram(bins=10,color="white")


###########Scatterplot##########
names(Orange)

p <- ggplot(Orange,aes(x=age,y=circumference))
p + geom_point()

#2
p2 <- ggplot(Orange,aes(x=age,y=circumference,color="white"))
p2 + geom_point()

#3
p + geom_point(color="red")

#4
p3 <- ggplot(Orange,aes(x=age,y=circumference,color=Tree))
p3 + geom_point()

#5
p3 + geom_point() +
  labs(x="Age of Tree (in days)",
       y="Circumference of Tree (in mm)",
       color="Tree ID")

#6
p3 + geom_point() +
  labs(x="Age of Tree (in days)",
       y="Circumference of Tree (in mm)",
       color="Tree ID",
       title="Circumference vs. Age of Orange Trees",
       subtitle="By Dr. Taylor")


###########Boxplots#############

ggplot(ToothGrowth,aes(x=supp,y=len)) + geom_boxplot()
