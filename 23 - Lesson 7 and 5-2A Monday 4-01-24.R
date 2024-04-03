#23 - Monday, April 1, 2024
#Lesson 7 continued
#Lesson 5-2A

#Exercise

#Build up our code:
num <- 5
x <- 1:num
x
sum(x)

#From the notes, fill this in:
MySum <- function(num){
  x <- 1:num
  thesum <- sum(x)
  return(thesum)
}

MySum
args(MySum)

MySum(2)
MySum(5)
MySum(100)


#############Exercise #2

TwoDice <- function(N){
  rolls <- replicate(N,sum(sample(1:6,2,replace=TRUE)))
  myprop <- sum(rolls==7)/N
  myreturn <- list(myrolls = rolls, myprop = myprop)
  return(myreturn)
}

TwoDice(10)

out <- TwoDice(N=1000)
out$myprop
table(out$myrolls)
hist(out$myrolls,freq=TRUE,breaks=1:12)




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



zscores <- (samp.means - 100)/(5/sqrt(9))
tscores <- (samp.means - 100)/(samp.sd/sqrt(9))




mydata.df <- data.frame(samp.means=samp.means,
                        samp.sd=samp.sd,
                        zscores=zscores,
                        tscores=tscores)