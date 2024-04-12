#Notes 5-3A Code to Copy


#Recall:
set.seed(2320)
mydata <- replicate(5000,rnorm(30,100,5))
tscore <- (apply(mydata,2,mean)-100)/(apply(mydata,2,sd)/sqrt(30))
example <- data.frame(tscore=tscore)
ggplot(example,aes(x=tscore)) + 
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30) +
  stat_function(fun=dt,args=list(df=30-1))





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





#-----------------------------------------------------#
#Example 3

#From page 1: myvalues <- rnorm(30,100,10)

#What happens for different levels of confidence
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,8),nrow=3,ncol=3)
out1 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[1])
out2 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[2])
out3 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[3])

ci[,1] <- loc
ci[1,2:3] <- out1$conf.int[1:2]
ci[2,2:3] <- out2$conf.int[1:2]
ci[3,2:3] <- out3$conf.int[1:2]
ci

#Where are they centered?
apply(ci[,2:3],1,mean)
mean(myvalues)










#----------------------------------------------------------#
#Example 5
library(ggplot2)
library(dplyr)
library(RColorBrewer)
loc <- 0.95
mysim <- replicate(100,t.test(rnorm(30,100,10),
                              alternative="two.sided",
                              mu=100,
                              conf.level=loc)$conf.int[1:2])
lower <- mysim[1,]
upper <- mysim[2,]
indicator <- if_else(lower <= 100 & upper >= 100, 1, 0)
nsim <- length(lower)
mydata <- data.frame(row=1:length(mysim[1,]),
                     point.estimate=apply(mysim,2,mean),
                     lower.bound=lower,
                     upper.bound=upper,
                     check=indicator)
g <- ggplot(mydata,aes(x=row,
                       y=point.estimate,
                       ymin=lower.bound,
                       ymax=upper.bound,
                       color=factor(check))) +  
  geom_pointrange() + 
  coord_flip() +
  geom_hline(yintercept=100) +
  labs(title=paste("Simulation of ",loc*100,"% confidence",sep=""),
       subtitle=paste("Captured:",sum(indicator),"out of",nsim, "simulations"),
       x="",
       y="Confidence Intervals",
       color="Captured?")+
  scale_color_brewer(palette="Dark2")   
plot(g)
