#11 - Lesson 4-1 continued
#Monday, 2/26/24

library(tidyverse) #or library(ggplot2)
ggplot(ToothGrowth,aes(x=supp,y=len)) + geom_boxplot()

#Re-write line 5 using the piping operator %>%
ToothGrowth %>%
  ggplot(aes(x=supp,y=len)) + geom_boxplot() + ggtitle("Update")

#1
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot() + 
  geom_point()

ggplot(ToothGrowth,aes(x=supp,y=len)) + 
    geom_point() +
  geom_boxplot()

#2
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot() + 
  geom_point() +
  coord_flip()

#3
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot(fill="green") + 
  geom_point(color="blue") +
  coord_flip()

#4
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot(fill="green") + 
  geom_jitter(color="blue") +
  coord_flip()

#5
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot(fill="green") + 
  geom_jitter(aes(color=supp)) +
  coord_flip()


#diamonds example
View(diamonds)
?diamonds

ggplot(diamonds,aes(x=price,y=cut)) + geom_boxplot()

#1
ggplot(diamonds,aes(x=price,y=cut)) + geom_boxplot() +
  scale_x_log10()

#2
ggplot(diamonds,aes(x=price,y=cut)) + geom_boxplot() +
  scale_x_reverse()

#3
ggplot(diamonds,aes(y=price,x=cut)) + geom_boxplot() +
  scale_x_log10()

#4
ggplot(diamonds,aes(x=price,y=cut)) + geom_boxplot() +
  scale_x_log10()+
  coord_flip()


#Example
View(mtcars)
table(mtcars$cyl)

ggplot(mtcars,aes(x=mpg,y=cyl)) + geom_boxplot()

#Solution #1
ggplot(mtcars,aes(x=mpg,group=cyl)) + geom_boxplot()

#Solution #2
ggplot(mtcars,aes(x=mpg,y=factor(cyl)          )) + geom_boxplot()



#Example
ggplot(diamonds,aes(x=price)) + geom_histogram()

#2
ggplot(diamonds,aes(x=price)) + geom_histogram(bins=2)

#3
ggplot(diamonds,aes(x=price)) + geom_histogram(bins=20,
                                               color="white")

hist(diamonds$price)
box()


#Example
ggplot(diamonds,aes(x=cut)) + geom_bar()

#1
ggplot(diamonds,aes(x=cut)) + geom_bar(fill="purple")

#2
ggplot(diamonds,aes(x=cut,fill=clarity)) + geom_bar()
ggplot(diamonds,aes(x=cut,fill=clarity)) + geom_bar(fill="purple")

#3
ggplot(diamonds,aes(x=cut,fill=clarity)) + geom_bar() +
  labs(fill="CLARITY")


#Example
Majors < c("A&S","Bus","Comm","Edu","Other")
Count <- c(2894,2046,1374,257,591)
Elon <- data.frame(Majors,Count)

ggplot(Elon,aes(x=Majors,y=Count)) + geom_col()

#2
ggplot(Elon,aes(x=Majors,y=Count,fill=Count)) + geom_col()



#How to get rid of that pesky legend:
ggplot(Elon,aes(x=Majors,y=Count,fill=Count)) + geom_col() +
  guides(fill="none")
