#24 - Lesson 5-2A Continued
#Wednesday, 4/3/24

#Notes 5-2A Code to Copy
#Beyond the Normal Distribution, Part 1

#-------------------------------------Investigation #1-----------------------------#
#Going from Z to t

library(tidyverse)
library(patchwork)
set.seed(2024)
mydata <- replicate(10000,rnorm(9,100,5))
#Check: What does mydata look like?
dim(mydata)
mydata[,1:5]

samp.means <- apply(mydata,2,mean)
#Check: length(samp.means)
samp.sd <- apply(mydata,2,sd)
#Check: length(samp.sd)

#Verifying the note in our notes
#what does the first sample look like?
mydata[,1]
mean(mydata[,1])
samp.means[1]
sd(mydata[,1])
samp.sd[1]

zscores <- (samp.means - 100)/(5/sqrt(9))
tscores <- (samp.means - 100)/(samp.sd/sqrt(9))

length(zscores)
length(tscores)


mydata.df <- data.frame(samp.means=samp.means,
                        samp.sd=samp.sd,
                        zscores=zscores,
                        tscores=tscores)




A <- ggplot(mydata.df,aes(x=samp.means)) + 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30) +
  stat_function(fun=dnorm,args=list(mean=100,sd=5/sqrt(9)))
A #Beautiful CLT! :)


B <- ggplot(mydata.df,aes(x=zscores)) + 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30) +
  stat_function(fun=dnorm,args=list(mean=0,sd=1))
B #Beautiful Z-scores! :)




C <- ggplot(mydata.df,aes(x=tscores))+ 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30) +
  stat_function(fun=dnorm,args=list(mean=0,sd=1),color="red",size=1.5)
C




D <- ggplot(mydata.df,aes(x=tscores))+ 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30) +
  stat_function(fun=dt,args=list(df=8),color="blue",size=1.5,linetype=2)
D




E <- ggplot(mydata.df,aes(x=tscores))+ 
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30) +
  stat_function(fun=dnorm,args=list(mean=0,sd=1),color="red",size=1.5)+
  stat_function(fun=dt,args=list(df=8),color="blue",size=1.5,linetype=2)
E






#Illustration #1
x <- seq(-3.25,3.25,.01)
y1 <- dt(x,9)
y2 <- dt(x,15)
y3 <- dt(x,48)
t.df <- data.frame(x=x,y1=y1,y2=y2,y3=y3)
ggplot(t.df,aes(x=x,y=y1)) +
  geom_line(color="pink",linetype=1,size=1.25)+
  geom_line(aes(y=y2),color="purple",linetype=2,size=1.25)+
  geom_line(aes(y=y3),color="orange",linetype=3,size=1.25)





#Illustration #2
x <- seq(-3.25,3.25,.01)
y1 <- dt(x,999)
y2 <- dnorm(x)
t.df <- data.frame(x=x,y1=y1,y2=y2)
ggplot(t.df,aes(x=x,y=y1)) +
  geom_line(color="red",linetype=1,size=1.25)+
  geom_line(aes(y=y2),color="blue",linetype=2,size=1.25)+
  ggtitle("T(999) and Z Curves")


#What if we use the normal distribution instead of t?
pnorm(-1.7)
pt(-1.7,9)

qnorm(.975)
qt(.975,9)

#Verifying the variance calculation
myt <- rt(50000,10)
hist(myt)
var(myt)
10/(10-2) #the theoretical variance!





#-------------------------------------Investigation #2-----------------------------#
#What is the distribution of t^2

mydata.df <- mutate(mydata.df,mystery=tscores*tscores)
ggplot(mydata.df,aes(x=mystery))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",bins=30)+
  ylim(c(0,0.5))



#BOO!
ggplot(mydata.df,aes(x=mystery))+  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  stat_function(fun=df,args=list(df1=1,df2=9))




mydata.df <- mutate(mydata.df, newy=case_when(
  df(mystery,1,9) >= 0.5 ~ NA,
  .default = df(mystery,1,9)
))

ggplot(mydata.df,aes(x=mystery))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  geom_line(aes(y=newy))










#####Verify mean and variance########
ndf = 4
ddf = 99

myf <- rf(10000,df1=ndf,df2=ddf)
hist(myf)

mean(myf)
ddf/(ddf-2)

var(myf)
(2*ddf*ddf*(ndf+ddf-2))/(ndf*(ddf-2)*(ddf-2)*(ddf-4))











x <- seq(0.1,20,.01)
y1 <- df(x,3,126)
y2 <- df(x,6,45)
y3 <- df(x,1,9)
f.df <- data.frame(x=x,y1=y1,y2=y2,y3=y3)
ggplot(f.df,aes(x=x,y=y1)) +
  geom_line(color="pink",linetype=1,size=1.25)+
  geom_line(aes(y=y2),color="purple",linetype=2,size=1.25)+
  geom_line(aes(y=y3),color="orange",linetype=3,size=1.25)



