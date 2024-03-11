#16 - Notes 5-1B Continued
#March 8, 2024

library(haven)
bweight <- read_sas("~/STS 347/0_Spring 2024/New Data/bweight.sas7bdat", 
                    NULL)

#What if we go two standard deviations from the mean for the
#Weight variable for the bweight data??
onebelow <- mean(bweight$Weight) - 2*sd(bweight$Weight)
oneabove <- mean(bweight$Weight) + 2*sd(bweight$Weight)

sum(bweight$Weight <= oneabove & bweight$Weight >= onebelow)/length(bweight$Weight)


######Notes 5-1B

set.seed(2320)
out <- rnorm(100)
hist(out,freq=FALSE)
mean(out)
sd(out)
round(mean(out),2)


out.df <- data.frame(out=out)
library(tidyverse)
ggplot(out.df,aes(x=out))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=30)

out.mean <- mean(out)
out.sd <- sd(out)

lower <- out.mean - out.sd
upper <- out.mean + out.sd

sum(out <= upper & out >= lower)/100

#10
lower2 <- out.mean - 2*out.sd
upper2 <- out.mean + 2*out.sd

sum(out <= upper2 & out >= lower2)/100


#11 Hint: This is the updated syntax for the later:
#stat_function(fun=dnorm,args=list(mean=__,sd=__))




set.seed(6493)
out <- rnorm(100,100,25)
hist(out,freq=FALSE)
mean(out)
sd(out)
round(mean(out),2)

out.df <- data.frame(out=out)
ggplot(out.df,aes(x=out))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=30)+
  stat_function(fun=dnorm,args=list(mean=100,sd=25))

out.mean <- mean(out)
out.sd <- sd(out)

lower <- out.mean - out.sd
upper <- out.mean + out.sd
lower2 <- out.mean - 2*out.sd
upper2 <- out.mean + 2*out.sd

sum(out <= upper & out >= lower)/100
sum(out <= upper2 & out >= lower2)/100


#12
set.seed(6493)
out <- rnorm(5000,100,25)
hist(out,freq=FALSE)
mean(out)
sd(out)
round(mean(out),2)

out.df <- data.frame(out=out)
ggplot(out.df,aes(x=out))+
  geom_histogram(aes(y=after_stat(density)),
                 color="white",
                 bins=30)+
  stat_function(fun=dnorm,args=list(mean=100,sd=25))

out.mean <- mean(out)
out.sd <- sd(out)

lower <- out.mean - out.sd
upper <- out.mean + out.sd
lower2 <- out.mean - 2*out.sd
upper2 <- out.mean + 2*out.sd

sum(out <= upper & out >= lower)/5000
sum(out <= upper2 & out >= lower2)/5000

#####Expected value

set.seed(2320)
x <- rnorm(1000,100,5)
mean(x)
sd(x)
trans.x <- 5*x
mean(trans.x)
sd(trans.x)












