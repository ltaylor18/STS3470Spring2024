#25 - Notes 5-2A Continued
#Friday, April 5, 2024

#-------------------------------------Investigation #3-----------------------------#
#What is the distribution of z^2

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



zscores <- (samp.means - 100)/(5/sqrt(9))
tscores <- (samp.means - 100)/(samp.sd/sqrt(9))




mydata.df <- data.frame(samp.means=samp.means,
                        samp.sd=samp.sd,
                        zscores=zscores,
                        tscores=tscores)

mydata.df2 <- mutate(mydata.df,mystery2=zscores*zscores)

ggplot(mydata.df2,aes(x=mystery2))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  ylim(c(0,1))



#This is how we would be included to do it, but ...
ggplot(mydata.df2,aes(x=mystery2))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  stat_function(fun=dchisq,args=list(df=1))




mydata.df2 <- mutate(mydata.df2,newy2=case_when(
  dchisq(mystery2,1) >= 1 ~ NA,
  .default = dchisq(mystery2,1)
))
#close to 0 we are getting HUGE density values!
ggplot(mydata.df2,aes(x=mystery2))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  geom_line(aes(y=newy2))

df = 10

mychi <- rchisq(10000,df=df)

mean(mychi)
df

var(mychi)
2*df


x <- seq(0.001,70,.01)
y1 <- dchisq(x,3)
y2 <- dchisq(x,45)
y3 <- dchisq(x,19)
chisq.df <- data.frame(x=x,y1=y1,y2=y2,y3=y3)
ggplot(chisq.df,aes(x=x,y=y1)) +
  geom_line(color="pink",linetype=1,size=1.25)+
  geom_line(aes(y=y2),color="purple",linetype=2,size=1.25)+
  geom_line(aes(y=y3),color="orange",linetype=3,size=1.25) 




#-------------------------------------Investigation #4-----------------------------#
#What is the distribution of sample variance?

set.seed(2320)
myvar <- replicate(5000,var(rnorm(30,sd=5)))

ggplot(NULL,aes(x=myvar))+geom_histogram(color="white",bins=30)






newvar <- (30-1)*myvar/25
myvardata <- data.frame(newvar=newvar)

ggplot(myvardata,aes(x=newvar))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)

#2b. Solution 1:
ggplot(myvardata,aes(x=newvar))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  stat_function(fun=dchisq,args=list(df=29))

#2b. Solution 2:
y <- dchisq(newvar,29)
ggplot(myvardata,aes(x=newvar))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  geom_line(aes(y=y))



#3. Repeating the investigation:
set.seed(2320)
myvar <- replicate(5000,var(rnorm(30,mean=500,sd=10))) #so variance=10*10 = 100

newvar <- (30-1)*myvar/100  #update the denominator to the population variance!
myvardata <- data.frame(newvar=newvar)

ggplot(myvardata,aes(x=newvar))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  stat_function(fun=dchisq,args=list(df=29))


#3. Repeating the investigation:
set.seed(2320)
myvar <- replicate(5000,var(rchisq(30,df=5))) #so variance=2*5 = 10

newvar <- (30-1)*myvar/10  #update the denominator to the population variance!
myvardata <- data.frame(newvar=newvar)

ggplot(myvardata,aes(x=newvar))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  stat_function(fun=dchisq,args=list(df=29))

