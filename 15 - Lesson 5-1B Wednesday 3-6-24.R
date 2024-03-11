#Wednesday, March 6
#Notes 5-1A Activity 1
#Notes 5-1B

#Notes 5-1A Activity 1 SOLUTIONS
library(haven)
bweight <- read_sas("~/STS 347/0_Spring 2024/New Data/bweight.sas7bdat", 
                    NULL)
View(bweight)

#1
ggplot(bweight,aes(x=Weight)) + 
  geom_histogram(color="white")

#2
ggplot(bweight,aes(x=Weight,
                   y=after_stat(density))) + 
  geom_histogram(color="white")

#3a
mean(bweight$Weight)
sd(bweight$Weight)

#3b
x <- seq(min(bweight$Weight),max(bweight$Weight),0.5)

#3c
y <- dnorm(x,mean(bweight$Weight),sd(bweight$Weight))

#mydata3 <- data.frame(x,y)

#4
ggplot(NULL,aes(x=bweight$Weight,y=after_stat(density))) + 
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y))

#5
update = sd(bweight$Weight)/sqrt(10)

set.seed(2320)
mysample <- sample(bweight$Weight,500,replace=FALSE)

ggplot(NULL,aes(x=mysample,y=after_stat(density))) + 
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y))

#6
mymat <- matrix(mysample,nrow=50)
mymeans <- apply(mymat,1,mean)

ggplot(NULL,aes(x=mymeans,y=after_stat(density))) + 
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y)) 



#############
#Notes 5-1B #
#############

pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)
pnorm(3) - pnorm(-3)
pnorm(-3) + (1-pnorm(3))

#5
pnorm(150,100,25) - pnorm(50,100,25)
#same as: pnorm(2) - pnorm(-2)

#6
pnorm(520,500,10) - pnorm(480,500,10)


#What if we go two standard deviations from the mean for the
#Weight variable for the bweight data??
onebelow <- mean(bweight$Weight) - 2*sd(bweight$Weight)
oneabove <- mean(bweight$Weight) + 2*sd(bweight$Weight)

sum(bweight$Weight <= oneabove & bweight$Weight >= onebelow)/length(bweight$Weight)

