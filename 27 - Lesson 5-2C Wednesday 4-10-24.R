#27 - Lesson 5-2C 
#Wednesday, 4/10/24

#Central Limit Theorem revisited!

library(tidyverse)

#-------------------------------------------------#
#Investigation #1

#1
out <- rf(20,3,56)
mean(out)
sd(out)

ggplot(NULL,aes(x=out)) +
  geom_histogram(color="white",bins=20)

#2
mean(rf(20,3,56))

#3
xbar <- replicate(10000,mean(rf(20,3,56)))
length(xbar)

#4
mean(xbar)
sd(xbar)
ggplot(NULL,aes(x=xbar)) +
  geom_histogram(color="white",bins=30)

.887/sqrt(20)

#Extension
mydata <- data.frame(xbar=xbar)
ggplot(mydata,aes(x=xbar)) +
  geom_histogram(aes(y=after_stat(density))
    ,color="white",bins=30)+
  stat_function(fun=dnorm,args=list(mean=1.037,
                                    sd=.887/sqrt(20)))
#This looks a little wonky!

#-------------------------------------------------#
#Investigation #2

#1
out <- rf(100,3,56) #update 20 --> 100
mean(out)
sd(out)

ggplot(NULL,aes(x=out)) +
  geom_histogram(color="white",bins=20)

#2
mean(rf(100,3,56)) #update 20 --> 100

#3
xbar <- replicate(10000,mean(rf(100,3,56))) #update 20 --> 100
length(xbar)

#4
mean(xbar)
sd(xbar)
ggplot(NULL,aes(x=xbar)) +
  geom_histogram(color="white",bins=30)

.887/sqrt(100) #update 20 --> 100

#Extension
mydata <- data.frame(xbar=xbar)
ggplot(mydata,aes(x=xbar)) +
  geom_histogram(aes(y=after_stat(density))
                 ,color="white",bins=30)+
  stat_function(fun=dnorm,args=list(mean=1.037,
                                    sd=.887/sqrt(100))) #update 20 --> 100


