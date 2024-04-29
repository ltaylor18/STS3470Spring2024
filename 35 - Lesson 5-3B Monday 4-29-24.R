#35 - Lesson 5-3B (and Lesson 6A?)
#Monday, 4/29/24

#Notes 5-3B Code to Copy

#####Scenario 1
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=TRUE)$p.value)

sum(pvalsEV <= 0.05)/1000


#####Scenario 2
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=FALSE)$p.value)

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!

sum(pvalsEV <= 0.05)/1000 

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.10!

sum(pvalsEV <= 0.10)/1000 

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.01!

sum(pvalsEV <= 0.01)/1000 


#####Scenario 3
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,15), 
                            rnorm(20,100,15),
                            var.equal=TRUE)$p.value)

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!

sum(pvalsEV <= 0.05)/1000

#####Scenario 4
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,15), 
                            rnorm(20,100,15),
                            var.equal=FALSE)$p.value)

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!

sum(pvalsEV <= 0.05)/1000




#Re-do with same sample size!

#####Scenario 1
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(100,100,15),
                            var.equal=TRUE)$p.value)
print("Scenario 1")
sum(pvalsEV <= 0.05)/1000


#####Scenario 2
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(100,100,15),
                            var.equal=FALSE)$p.value)
print("Scenario 2")
#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!

sum(pvalsEV <= 0.05)/1000 

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.10!

sum(pvalsEV <= 0.10)/1000 

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.01!

sum(pvalsEV <= 0.01)/1000 


#####Scenario 3
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,15), 
                            rnorm(100,100,15),
                            var.equal=TRUE)$p.value)

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!
print("Scenario 3")
sum(pvalsEV <= 0.05)/1000

#####Scenario 4
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,15), 
                            rnorm(100,100,15),
                            var.equal=FALSE)$p.value)

#counting up the number of simulations that lead to the 
#wrong conclusion when alpha=0.05!
print("Scenario 4")
sum(pvalsEV <= 0.05)/1000



#--------------------------------------------------------------#
##ANOVA


out <- aov(mtcars$hp ~ mtcars$am)
anova(out)

pf(1.886,1,30,lower.tail=FALSE)
1-pf(1.886,1,30)

#Simulation
n1 <- 30
n2 <- 40
n3 <- 50
n4 <- 60
anova(aov(rnorm(n1+n2+n3+n4,100,10) ~ c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))))$`F value`[1]


#Generating the data
mygroups <- c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))
myvalues <- rnorm(n1+n2+n3+n4,100,10)

#Look at each piece!
out <- aov(myvalues ~ mygroups)
anova(out)
anova(out)$`F value`
anova(out)$`F value`[1]

anova(aov(myvalues ~ mygroups))$`F value`[1]


#p. 14 Use replicate() to repeat this line of code 1000 times to generate
#1000 F test statistics.
#Then draw a histogram of the test statistics and super-impose the correct
#curve on top!

anova(aov(rnorm(n1+n2+n3+n4,100,10) ~ c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))))$`F value`[1]


n1 <- 30
n2 <- 40
n3 <- 50
n4 <- 60
myF <- replicate(1000,anova(aov(rnorm(n1+n2+n3+n4,100,10) ~ c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))))$`F value`[1])
library(ggplot2)
myF.df <- data.frame(myF=myF,myy=df(myF,4-1,n1+n2+n3+n4-4))
ggplot(myF.df,aes(x=myF)) + geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  geom_line(aes(y=myy),color="red")
