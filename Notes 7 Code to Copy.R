#Notes 7 Code to Copy

#-----------------------------------------------------------------#
#-----------------------------------------------------------------#
MyMean <-  function(X) { 
  S <- sum(X) 
  L <- length(X) 
  M <- S/L 
  m <- c("Mean is: ", M) 	#creates a character string   
  newS <- paste("Sum is: ", S)  #what does paste do?
  newL <- paste("Length is: ", L)
  print(newS) #What is the default output?
  print(newL, quote=FALSE) #What does quote=FALSE do?
  print(m, quote=FALSE) #Did we get the same output?  
  X  #what happens to whatever you list last?
}#end function






#-----------------------------------------------------------------#
#-----------------------------------------------------------------#
mymean <- ____ #Fill in the blank!
mysd <- ____ #Fill in the blank!

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






#-----------------------------------------------------------------#
#-----------------------------------------------------------------#

set.seed(2320)
mydata <- rnorm(1000*30)
mydata.mat <- matrix(mydata,nrow=1000,ncol=30)
mypvals <- NULL
for(i in 1:1000){
  out <- t.test(mydata.mat[i,],alternative="two.sided",mu=0)
  mypvals[i] <- out$p.value
}

sum(mypvals <= 0.05)/1000
