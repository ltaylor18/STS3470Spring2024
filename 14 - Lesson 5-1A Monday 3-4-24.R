#14 - Lesson 5-1A continued
#Monday, March 4, 2024

library(tidyverse)

#Notes 5-1A Addendum

myx <- c(1,2,2,3,3,3,3,4,4,5)
length(myx)
out.x <- data.frame(myx=myx)

#2
ggplot(out.x,aes(x=myx)) +
  geom_histogram(color="white",bins=5)

#Default bins=30
ggplot(out.x,aes(x=myx)) +
  geom_histogram(color="white")

#4
ggplot(out.x,aes(x=myx)) +
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=5)
#6
ggplot(out.x,aes(x=myx)) +
  geom_histogram(color="white",bins=10)

#7
ggplot(out.x,aes(x=myx)) +
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=10)



#page 7
x1 <- seq(0,200,0.5)
y1 <- dnorm(x1,100,15)
mydata2 <- data.frame(x1=x1,y1=y1)
ggplot(mydata2,aes(x=x1,y=y1)) + geom_line()


mydata2 <- mutate(mydata2,y2=dnorm(x1,90,5))
ggplot(mydata2,aes(x=x1,y=y1)) + 
  geom_line(color="purple") + 
  geom_line(aes(y=y2),color="green")






#page 9
ggplot(NULL,aes(x=bweight$Weight,y=after_stat(density))) + 
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y))









