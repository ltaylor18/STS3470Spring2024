#20 - Monday, 3/18/24
#Notes 5-1C Continued

library(tidyverse)
library(patchwork)

#Activity 1

x <- rnorm(30,100,5)
mean(x)
sd(x)

ggplot(NULL,aes(x=x)) +   geom_histogram(color="white", 
                 bins=10)

#2 --- original steps all in one!
mean(rnorm(30,100,5))

#3 
out <- replicate(10000,mean(rnorm(30,100,5)))

#4
mean(out)
sd(out)
5/sqrt(30)

ggplot(NULL,aes(x=out)) +
  geom_histogram(color="white",
                 bins=30) + 
  labs(title="Distribution of sample means when n=30")

out.df <- data.frame(out=out)
ggplot(out.df,aes(x=out)) +
  geom_histogram(aes(y=after_stat(density)),color="white",
                 bins=30) + 
  labs(title="Distribution of sample means when n=30")+
  stat_function(fun=dnorm,args=list(mean=100,sd=5/sqrt(30)))



#Notes 5-1C Extension
#Central Limit Theorem

library(tidyverse)
library(patchwork)

set.seed(2320)
x.axis <- seq(0,200)
y.pop <- dnorm(x.axis,100,25)

A <- ggplot(NULL,aes(x=x.axis,y=y.pop)) + 
  geom_line()+
  labs(title="Population, Normal(100,25)")

A

#samples of size 5
mean.5 <- replicate(5000,mean(rnorm(5,100,25)))
out.5 <- data.frame(mean.5=mean.5)
B <- ggplot(out.5,aes(x=mean.5))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=50) +
  labs(y="density",
       title="Mean of samples of size 5")+
  stat_function(fun=dnorm,
                args=list(mean=100,sd=25/sqrt(5)),
                size=1.5,
                color="red")+
  xlim(c(0,200))

B


#samples of size 20
mean.20 <- replicate(5000,mean(rnorm(20,100,25)))
out.20 <- data.frame(mean.20=mean.20)
C <- ggplot(out.20,aes(x=mean.20))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=75) +
  labs(title="Mean of samples of size 20")+
  stat_function(fun=dnorm,
                args=list(mean=100,sd=25/sqrt(20)), #update n=5 to 20!
                size=1.5,
                color="red")+
  xlim(c(0,200))

C

#samples of size 100
mean.100 <- replicate(5000,mean(rnorm(100,100,25)))
out.100 <- data.frame(mean.100=mean.100)
D <- ggplot(out.100,aes(x=mean.100))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=100) +
  labs(title="Mean of samples of size 100")+
  stat_function(fun=dnorm,
                args=list(mean=100,sd=25/sqrt(100)), #update to n=100
                size=1.5,
                color="red")+
  xlim(c(0,200))

D

A/B/C/D




##############Investigation #2#####################
library(patchwork)
library(tidyverse)
set.seed(2320)
mymean <- 29 #Fill in the blank!
mysd <- 4 #Fill in the blank!
x <- rnorm(50000,mymean,mysd)
xbar <- apply(matrix(x,nrow=10000),1,mean)

myxdata <- data.frame(xbar=xbar)
xbarplot <- ggplot(myxdata,aes(x=xbar))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=30)+
  stat_function(fun=dnorm,
                args=list(mean=mymean,sd=mysd/sqrt(5)),
                size=1.25)+
  labs(title="Histogram of X-Bar Values")
xbarplot
#Check: length(xbar)
z <- (xbar-mymean)/(mysd/sqrt(5))
myzdata <- data.frame(z=z)
zplot <- ggplot(myzdata,aes(x=z)) + 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=30) + 
  stat_function(fun=dnorm,
                args=list(mean=0,sd=1),
                size=1.25)+
  labs(title="Histogram of Z")
zplot

xbarplot/zplot

mean(z)
sd(z)
