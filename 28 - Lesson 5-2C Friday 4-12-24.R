#28 - Friday, 4/12/24
#Notes 5-2C Continued

library(tidyverse)

#----------------------------------------#
#Investigation 3

#6
out <- runif(30,0,10)
out
mean(out)
sd(out)

ggplot(NULL,aes(x=out))+
  geom_histogram(color="pink",bins=20)

#7
mean(runif(30,0,10))

#8
myout <- replicate(10000,mean(runif(30,0,10)))

#9
mean(myout)
#This should be 5

sd(myout)
2.887/sqrt(30)

ggplot(NULL,aes(x=myout))+
  geom_histogram(color="pink",bins=30)

mydata <- data.frame(myout=myout)
ggplot(mydata,aes(x=myout))+
  geom_histogram(aes(y=after_stat(density)),color="pink",bins=30)+
  stat_function(fun=dnorm,args=list(mean=5,
                                    sd=2.887/sqrt(30)))


#----------------------------------------#
#Investigation 4, n=7

#6
out <- runif(7,0,10) #change 30 to 7!
out
mean(out)
sd(out)

ggplot(NULL,aes(x=out))+
  geom_histogram(color="pink",bins=20)

#7
mean(runif(7,0,10)) #change 30 to 7!

#8
myout <- replicate(10000,mean(runif(7,0,10))) #change 30 to 7!

#9
mean(myout)
#This should be 5

sd(myout)
2.887/sqrt(7) #change 30 to 7!

ggplot(NULL,aes(x=myout))+
  ggtitle("Updated, n=7") +
  geom_histogram(color="pink",bins=30)

mydata <- data.frame(myout=myout)
ggplot(mydata,aes(x=myout))+
  geom_histogram(aes(y=after_stat(density)),color="pink",bins=30)+
  ggtitle("Updated, n=7") +
  stat_function(fun=dnorm,args=list(mean=5,
                                    sd=2.887/sqrt(7)))  #change 30 to 7!




#----------------------------------------#
#Investigation 4, Repeated with different distribution, n=7

#6
out <- rchisq(7,3) #change 30 to 7!
out
mean(out)
sd(out)

ggplot(NULL,aes(x=out))+
  geom_histogram(color="pink",bins=20)

#7
mean(rchisq(7,3)) #change 30 to 7!

#8
myout <- replicate(10000,mean(rchisq(7,3))) #change 30 to 7!

#9
mean(myout)
#This should be 3

sd(myout)
sqrt(2*3)/sqrt(7) #change 30 to 7!

ggplot(NULL,aes(x=myout))+
  ggtitle("Updated, n=7") +
  geom_histogram(color="pink",bins=30)

mydata <- data.frame(myout=myout)
ggplot(mydata,aes(x=myout))+
  geom_histogram(aes(y=after_stat(density)),color="pink",bins=30)+
  ggtitle("Updated, n=7") +
  stat_function(fun=dnorm,args=list(mean=3,
                                    sd=sqrt(2*3)/sqrt(7)))  #change 30 to 7!

