#34 - Lesson 5-3B
#Friday, 4/26/24

#Notes 5-3B Code to Copy

#----------------------------------------------------------#
#PAIRED T-TEST
View(sleep)

library(dplyr)
sleep.sorted <- arrange(sleep,ID)

#base
extra1 <- sleep.sorted$extra[sleep.sorted$group == 1]
#dplyr
extra2 <- select(filter(sleep.sorted,group==2),extra)

diff <- extra1-extra2
diff2 <- extra2-extra1

mysleep <- data.frame(extra1,extra2,diff)
names(mysleep) <- c("extra1","extra2","diff")

#Formula approach
t.test(extra~group,paired=TRUE,data=sleep)

#Other syntax
t.test(diff,data=mysleep)
t.test(diff2,data=mysleep)

t.test(mysleep$extra1,mysleep$extra2,paired=TRUE)


#2 What if?
diff2 <- extra2 - extra1
cbind(diff,diff2) #How do diff and diff2 compare?




#----------------------------------------------------------#
#TWO-INDEPENDENT SAMPLE T-TESTS

select(mtcars,hp,am) %>% head()

auto <- filter(mtcars,am==0) %>% select(hp)
manual <- filter(mtcars,am==1) %>% select(hp)
head(auto)
head(manual)


#Syntax A
t.test(mtcars$hp ~ mtcars$am, var.equal=TRUE)

#Syntax B
t.test(mtcars$hp ~ mtcars$am, var.equal=FALSE)

#Syntax C
t.test(mtcars$hp ~ mtcars$am)

#Syntax D
t.test(auto,manual)

#Syntax E (Reverse the variables)
t.test(manual,auto)

#Syntax F (Reverse the variables)
t.test(mtcars$am ~ mtcars$hp)


#2b.
var(auto)
var(manual)

#ratio of sample variances
var(manual)/var(auto)

#4.
t.test(manual,auto,conf.level=0.99)
t.test(manual,auto)

mean(t.test(manual,auto,conf.level=0.99)$conf.int[1:2])
126.8462-160.2632

#5.
t.test(manual,auto,conf.level=0.99,alternative="less")

#6
mycars <- mutate(mtcars,
                 transmission=if_else(am==0,
                                      "automatic",
                                      "manual")) %>%
  select(transmission,hp)

t.test(mycars$hp ~ mycars$transmission)






#############SIMULATION############
set.seed(6493)
library(ggplot2)
x1 <- rnorm(100,100,5)
x2 <- rnorm(20,100,15)
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE)
val=c(x1,x2)
grp=c(rep("A",100),rep("B",20)) 
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()


mysim <- function(n1=100,mean1=100,sd1=5,
                  n2=20,mean2=100,sd2=15){
  muindicator <- if_else(mean1==mean2,
                         "the null hypothesis is true (the data is generated from populations with equal means) and",
                         "the alternative hypothesis is true (the data is generate from populations with differen means) and")
  sdindicator <- if_else(sd1==sd2,"the simulated variances are EQUAL.",
                         "the simulated variances are NOT EQUAL.")
  
  x1 <- rnorm(n1,mean1,sd1)
  x2 <- rnorm(n2,mean2,sd2)
  print(paste("The variance of sample 1 is:",round(var(x1),3)))
  print(paste("The variance of sample 2 is:",round(var(x2),3)))
  
  equal_pval <- t.test(x1,x2,var.equal=TRUE)$p.value
  unequal_pval <- t.test(x1,x2,var.equal=FALSE)$p.value
  
  pindicator <- case_when(
    equal_pval <= 0.05 & unequal_pval <= 0.05 ~ "Both p-values are significant at the 0.05 level. The tests yielded the SAME CONCLUSION.",
    equal_pval <= 0.05 & unequal_pval > 0.05 ~ "The test assuming equal variance was significant at the 0.05 level, but the test assuming unequal variances was not. The tests came to DIFFERENT CONCLUSIONS.",
    equal_pval > 0.05 & unequal_pval <= 0.05 ~ "The test assuming unequal variances was significant at the 0.05 level, but the test assuming equal variances was not. The tests came to DIFFERENT CONCLUSIONS.",
    equal_pval > 0.05 & unequal_pval > 0.05 ~ "Both p-values are insignificant at the 0.05 level. The tests yielded the SAME CONCLUSION."
  )
  
  print(paste("In this simulation,",
              muindicator,
              sdindicator,
              "The t-test assuming equal variances had a p-value of",
              round(equal_pval,4),
              ". The t-test assuming unequal variances had a p-value of",
              round(unequal_pval,4),
              pindicator
  ))
  val=c(x1,x2)
  grp=c(rep("A",100),rep("B",20)) 
  mydata <- data.frame(val,grp)
  ggplot(mydata,aes(x=grp,y=val)) +    
    geom_boxplot() + ggtitle("Boxplot of Sample Data")
}





#####Scenario 1
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=TRUE)$p.value)

sum(pvalsEV <= 0.05)/1000













#--------------------------------------------------------------#
##ANOVA


n1 <- 30
n2 <- 40
n3 <- 50
n4 <- 60
anova(aov(rnorm(n1+n2+n3+n4,100,10) ~ c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))))$`F value`[1]


#Generating the data
mygroups <- c(rep("A",n1),rep("B",n2),rep("C",n3),rep("D",n4))
myvalues <- rnorm(n1+n2+n3+n4,100,10)

#Look at each piece!
out <- anova(myvalues ~ mygroups)
anova(out)
anova(out)$`F value`
anova(out)$`F value`[1]

anova(aov(myvalues ~ mygroups))$`F value`[1]