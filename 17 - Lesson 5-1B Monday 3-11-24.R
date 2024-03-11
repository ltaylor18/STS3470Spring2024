#17 - Notes 5-1B Continued
#March 11, 2024


#Theoretical Hypothesis #1:
#####Expected value

set.seed(2320)
x <- rnorm(1000,100,5)
mean(x)
sd(x)
trans.x <- 5*x
mean(trans.x)
sd(trans.x)


#####Expected value
#Check with another constant!

set.seed(6493)
x <- rnorm(1000,100,5)
mean(x)
sd(x)
trans.x <- 7*x
mean(trans.x)
sd(trans.x)

mean(trans.x)/mean(x)


#Theoretical Hypothesis #2:
#####Expected value
#Adding a constant!

set.seed(6493)
x <- rnorm(1000,100,5)
mean(x)
sd(x)
trans.x <- x + 10
mean(trans.x)
sd(trans.x)

mean(trans.x)-mean(x)



####Does it hold for other Normal distributions?


set.seed(6493)
x <- rnorm(1000,0,10)
mean(x)
sd(x)
trans.x <- (1/10)*x
mean(trans.x)
sd(trans.x)

mean(trans.x)/mean(x)



#####Expected value
#Adding a constant!

set.seed(6493)
x <- rnorm(1000,50,15)
mean(x)
sd(x)
trans.x <- x + 25
mean(trans.x)
sd(trans.x)

mean(trans.x)-mean(x)


#Theoretical Hypothesis #3
#####Expected value
#Adding a constant!

set.seed(6493)
x <- rnorm(1000,50,7)
mean(x)
sd(x)
trans.x <- 3*x + 100
mean(trans.x)
sd(trans.x)

3*mean(x)+100
mean(trans.x)


############Investigating the Variance!!!###############

x <- rnorm(5000,250,10)
mean(x)
sd(x)
var(x)

trans.x <- 7*x
mean(trans.x)
var(trans.x)

var(trans.x)/var(x)


trans.x <- 5*x
mean(trans.x)
var(trans.x)

var(trans.x)/var(x)



##########What about X+c???????#########
trans.x <- x + 100
var(x)
var(trans.x)



##########Visual check############
library(patchwork)
set.seed(2320)
x <- rnorm(5000,100,5)

trans.x1 <- 2*x 

trans.x2 <- x+50

mydata <- data.frame(x=x,trans.x1=trans.x1,trans.x2=trans.x2)
p1 <- ggplot(mydata,aes(x=x)) + geom_histogram(color="white") + 
  xlim(c(80,240))+
  labs(title="Original X")
p1
p2 <- ggplot(mydata,aes(x=trans.x1)) + geom_histogram(color="white") + 
  xlim(c(80,240)) +
  labs(title="Transformed, 2*X")
p2
p3 <- ggplot(mydata,aes(x=trans.x2)) + geom_histogram(color="white") + 
  xlim(c(80,240)) + 
  labs(title="Transformed, X + 50")
p3

p1/p2/p3
