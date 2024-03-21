#21 - Lesson 5-1C Continued, Lesson 7
#Wednesday, 3/20/24

set.seed(2320)
out <- rnorm(9,12,.05)
out

mean(out)
.05/3
12-.05/3


1-pnorm(mean(out),12,.05/3)
pnorm(mean(out),12,.05/3,lower.tail=FALSE)


myz <- (mean(out)-12)/(.05/sqrt(9))
myz

1-pnorm(myz)


##############Lesson 7#############
myfx <- function(x){
  out <- 6*x*x + 2*x - 4
  return(out)
}
myfx

myfx(0)
myfx(x=0)
myfx(1)

f10 <- myfx(10)
f10

myfx2 <- function(x){
  out <- 6*x*x + 2*x - 4
}

myfx2(0)
f0 <- myfx2(0)
f0

#Default value for argument
myfx3 <- function(x=0){
  out <- 6*x*x + 2*x - 4
  return(out)
}

myfx3()
myfx3(1)

args(myfx3)
args(pnorm)

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
