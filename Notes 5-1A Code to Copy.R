#Notes 5-1A Code to copy
library(ggplot2)

coin <- c("Heads","Tails")
set.seed(2320)
fewtosses <- sample(coin,100,replace=TRUE)

fewtosses_sum <- cumsum(fewtosses=="Heads")
fewtosses_prop <- fewtosses_sum/1:100

few <- data.frame(trial=1:100,propHeads=fewtosses_prop,tosses=fewtosses)
few_graph <- ggplot(few,aes(x=trial,y=propHeads))+
  geom_point()+
  geom_hline(yintercept=0.5,color="red")+
  geom_line(color="purple")

few_graph









#page 6
library(ggplot2)
x <- seq(-5,5,.05)
y <- dnorm(x)

mydata <- data.frame(x=x,y=y)

ggplot(mydata,aes(x=x,y=y))+
  geom_line()
#To see what is going on, change line to point












#page 7
x1 <- seq(______,_____,_____)
y1 <- dnorm(_________,_______,________)
mydata2 <- data.frame(x1=x1,y1=y1)
ggplot(mydata2,aes(x=____,y=______)) + geom_line()


mydata2 <- mutate(mydata2,y2=dnorm(x1,____,____))
ggplot(mydata2,aes(x=x1,y=y1)) + 
  geom_line(color="purple") + 
  geom_line(aes(y=____),color="green")













#page 9
ggplot(NULL,aes(x=bweight$Weight,y=after_stat(density))) + 
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y))







