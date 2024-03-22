#22 - Lesson 7 continued
#Friday, March 22, 2024
#Friday before Spring Break!!!!!!!!!!!!!!!!!!!


#-----------------------------------------------------------------#
#-----------------------------------------------------------------#
MyMean <-  function(X) { 
  S <- sum(X) 
  L <- length(X) 
  M <- S/L 
  m <- c("Mean is: ", M) 	#creates a character string   
  newS <- paste("Sum is: ", S)  #what does paste do?
  newL <- paste("Length is: ", L,sep=" ")
  print(newS) #What is the default output?
  print(newL, quote=FALSE) #What does quote=FALSE do?
  print(m, quote=FALSE) #Did we get the same output?  
  X  #what happens to whatever you list last? #return(X)
}#end function


MyMean

MyMean()

MyMean(trees$Volume)

out <- MyMean(trees$Volume)
out


MyMean(mtcars$mpg)


######Making a function from Notes 5-1C Example

library(tidyverse)
library(patchwork)


mysim <- function(mymean,mysd){

x <- rnorm(5000,mymean,mysd)
xbar <- apply(matrix(x,nrow=1000),1,mean)

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
}

args(mysim)
mysim(mymean=100,mysd=5)

mysim(mymean=50,mysd=15)


############Updating code to allow user to try different sample sizes!

mysim2 <- function(mymean,mysd,samplesize=5){
  
  x <- rnorm(samplesize*5000,mymean,mysd)
  xbar <- apply(matrix(x,nrow=5000),1,mean)
  
  myxdata <- data.frame(xbar=xbar)
  xbarplot <- ggplot(myxdata,aes(x=xbar))+
    geom_histogram(aes(y=after_stat(density)),
                   color="white",
                   bins=30)+
    stat_function(fun=dnorm,
                  args=list(mean=mymean,sd=mysd/sqrt(samplesize)),
                  size=1.25)+
    labs(title="Histogram of X-Bar Values")
  xbarplot
  #Check: length(xbar)
  z <- (xbar-mymean)/(mysd/sqrt(samplesize))
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
}

mysim2(100,5,30)
mysim2(-50,17,100)



#################Updating what we return!
mysim3 <- function(mymean,mysd,samplesize=5){
  
  x <- rnorm(samplesize*5000,mymean,mysd)
  xbar <- apply(matrix(x,nrow=5000),1,mean)
  
  myxdata <- data.frame(xbar=xbar)
  xbarplot <- ggplot(myxdata,aes(x=xbar))+
    geom_histogram(aes(y=after_stat(density)),
                   color="white",
                   bins=30)+
    stat_function(fun=dnorm,
                  args=list(mean=mymean,sd=mysd/sqrt(samplesize)),
                  size=1.25)+
    labs(title="Histogram of X-Bar Values")
  xbarplot
  #Check: length(xbar)
  z <- (xbar-mymean)/(mysd/sqrt(samplesize))
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
  
  out <- list(xbar=xbar,n=samplesize)
  return(out)
}

set.seed(2320)
myout <- mysim3(100,5,50)

myout[[1]]
myout$xbar

myout[[2]]
myout$n

#What percent of my xbar values were greater than 100?
sum(myout[[1]] > 100)/length(myout[[1]])

mean(myout[[1]])
sd(myout[[1]])  #5/sqrt(50)
