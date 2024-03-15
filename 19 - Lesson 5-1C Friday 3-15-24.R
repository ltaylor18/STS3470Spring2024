#19 - Notes 5-1B Conclusion
#Notes 5-1C
#March 15, 2024


##########Visual check############
library(patchwork)
library(tidyverse)
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

p1 + p2 + p3

p1/(p2+p3)

############Notes 5-1C#################

##Investigation #1
#Part A
x1 <- rnorm(5000)
x2 <- rnorm(5000)
y <- x1 + x2

library(tidyverse)
mydata <- data.frame(y=y)
ggplot(mydata,aes(x=y)) + 
  geom_histogram(color="white",bins=30)

mean(y)
var(y)

#Part B
x2 <- rnorm(5000,5,3)
y2 <- x1 + x2

mydata <- data.frame(y2=y2)
ggplot(mydata,aes(x=y2)) + 
  geom_histogram(color="white",bins=30)

mean(y2)
var(y2)

#Part C
x1 <- rnorm(5000,5,3)
x2 <- rnorm(5000,5,3)
y3 <- x1 + x2

mydata <- data.frame(y3=y3)
ggplot(mydata,aes(x=y3)) + 
  geom_histogram(color="white",bins=30)

mean(y3)
var(y3)


#Activity 1

x <- rnorm(30,100,5)
mean(x)
sd(x)

ggplot(NULL,aes(x=x)) +
  geom_histogram(color="white",
                 bins=10)


#2 --- original steps all in one!
mean(rnorm(30,100,5))


#3 
out <- replicate(10000,mean(rnorm(30,100,5)))

#4
mean(out)
sd(out)
5/sqrt(30)

ggplot(NULL,aes(x=out)) +
  geom_histogram(color="white",
                 bins=30)




