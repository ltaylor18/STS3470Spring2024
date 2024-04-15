#29 - Lesson 5-3A
#Monday, 4/15/24

#Recall:
set.seed(2320)
mydata <- replicate(5000,rnorm(30,100,5))
tscore <- (apply(mydata,2,mean)-100)/(apply(mydata,2,sd)/sqrt(30))
example <- data.frame(tscore=tscore)
ggplot(example,aes(x=tscore)) + 
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30) +
  stat_function(fun=dt,args=list(df=30-1))



#t.test example!
set.seed(6493)
myvalues <- rnorm(30,100,10)
myvalues

t.test(myvalues,alternative="two.sided",mu=100,conf.level=0.95)

(mean(myvalues)-100)/(sd(myvalues)/sqrt(30))

#What's in the middle of my CI?
(100.82420+93.60138)/2


#6a,b,c

t.test(myvalues,alternative="less",mu=105)


#7
out <- t.test(myvalues,alternative="less",mu=105)
out
out$statistic #test statistic!
out$p.value #p-value!
out$conf.int #confidence interval



#-----------------------------------------------------#
#Example 2
CIsim <- function(nreps=1000,n=30){
  #Simulate generating 30 observations from the Normal distribution and using t.test to calculate the lower bound and upper bound of the confidence interval
  mysim <- replicate(nreps,t.test(rnorm(n,100,10),
                                  alternative="two.sided",
                                  mu=100,
                                  conf.level=0.95)$conf.int[1:2])
  
  #Store the lower bounds in the object lower and upper bounds in the object upper
  lower <- mysim[1,]
  upper <- mysim[2,]
  
  width <- upper-lower
  #Create an indicator for if the true value of mu is in the interval
  library(dplyr)
  indicator <- if_else(lower <= 100 & upper >= 100, 1, 0)
  
  #How many intervals correctly captured the value of mu?
  print(paste("There were", 
              sum(indicator), 
              "simulations that contained the population mean of 100 out of",
              nreps, 
              "simulations."))
  print(paste("The proportion of ", 
              0.95*100,
              "% intervals that captured the mean of 100 was ", 
              sum(indicator)/nreps,
              sep=""))
  print(paste("The average width of these intervals was",
              round(mean(width),2)))
}


args(CIsim)
CIsim() #using default values


#From last class:
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

