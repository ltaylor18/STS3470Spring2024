#32 - Notes 5-3A continued, Notes 5-3B
#Monday, April 22, 2024

#-----------------------------------------------------#
#Example 3

#From page 1: myvalues <- rnorm(30,100,10)
myvalues <- rnorm(30,100,10)

#What happens for different levels of confidence
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,9),nrow=3,ncol=3)
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



#----------------------------------------------------------#
#Repeating Example 5 with 90% confidence
loc <- 0.90
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