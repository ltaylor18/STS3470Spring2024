#36 - Lesson 5-3B and Lesson 6A
#Monday, 4/29/24

out <- lm(mtcars$mpg ~ mtcars$wt)
summary(out)
plot(out)



out <- lm(mtcars$mpg ~ mtcars$wt -1)
summary(out)

out <- lm(mtcars$mpg ~ mtcars$wt + mtcars$hp)
summary(out)

#Notes 6A - Code to Copy

library(tidyverse)

#-----------------------------------------------------------------------------#
#Example 1

mytest <- function(alpha=0.05){
  x <- rnorm(30,100,1)
  pval <- t.test(x,alternative="two.sided",mu=100)$p.value
  
  if(pval < alpha) {results <- paste("Results are significant at the", alpha, "level.")}
  if(pval > alpha) {results <- paste("Results are not significant at the", alpha, "level.")}
  if(pval == alpha) {results <- paste("The p-value equals", alpha, ", the significance level.")}
  results
}

mytest()

out <- replicate(1000,mytest())

table(out)

rnorm(1)

if(rnorm(1)>0){print("positive")}

rnorm(30)
(rnorm(30) > 0)

if(rnorm(30)>0){print("positive")}

#-----------------------------------------------------------------------------#
#Example 2

mytest2 <- function(alpha=0.05){
  x <- rnorm(30,100,1)
  pval <- t.test(x,alternative="two.sided",mu=100)$p.value
  
  if(pval < alpha) {results <- paste("Results are significant at the", alpha, "level.")}
  if(pval > alpha) {
    pval.less <- t.test(x,alternative="less",mu=100)$p.value
    pval.great <- t.test(x,alternative="greater",mu=100)$p.value
    results <- paste("Results are not significant at the", alpha, "level, and the less than alternative has a p-value of ",round(pval.less,4),", and the greater than alternative has a p-value of ",round(pval.great,4))
  }
  if(pval == alpha) {results <- paste("The p-value equals", alpha, ", the significance level.")}
  results
}

mytest2() #Use alpha=0.50 to more quickly see other outputs!
mytest2(0.50)


#-----------------------------------------------------------------------------#
#Example 3

mytest3 <- function(alpha=0.05){
  x <- rnorm(30,100,1)
  pval <- t.test(x,alternative="two.sided",mu=100)$p.value
  xbar <- mean(x)
  
  if(pval < alpha & xbar > 100) {results <- paste("Results are significant at the", alpha, "level, and the mean is greater than 100.")}
  if(pval < alpha & xbar < 100) {results <- paste("Results are significant at the", alpha, "level, and the mean is less than 100.")}
  if(pval < alpha & xbar ==100) {results <- paste("Results are significant at the", alpha, "level, and the mean is 100.")}
  if(pval > alpha) {
    pval.less <- t.test(x,alternative="less",mu=100)$p.value
    pval.great <- t.test(x,alternative="greater",mu=100)$p.value
    results <- paste("Results are not significant at the", alpha, "level, and the less than alternative has a p-value of ",round(pval.less,4),", and the greater than alternative has a p-value of ",round(pval.great,4))
  }
  if(pval == alpha) {results <- paste("The p-value equals", alpha, ", the significance level.")}
  results
}

mytest3() #Use alpha=0.50 to more quickly see other outputs!
mytest3(0.50)


#-----------------------------------------------------------------------------#
#Example 4 (Example 3 UPDATED)

mytest3up <- function(alpha=0.05){
  x <- rnorm(30,100,1)
  pval <- t.test(x,alternative="two.sided",mu=100)$p.value
  xbar <- mean(x)
  
  if(pval < alpha & xbar > 100) {results <- paste("Results are significant at the", alpha, "level, and the mean is greater than 100.")
  } else if(pval < alpha & xbar < 100) {results <- paste("Results are significant at the", alpha, "level, and the mean is less than 100.")
  } else if(pval < alpha & xbar ==100) {results <- paste("Results are significant at the", alpha, "level, and the mean is 100.")
  } else if(pval > alpha) {
    pval.less <- t.test(x,alternative="less",mu=100)$p.value
    pval.great <- t.test(x,alternative="greater",mu=100)$p.value
    results <- paste("Results are not significant at the", alpha, "level, and the less than alternative has a p-value of ",round(pval.less,4),", and the greater than alternative has a p-value of ",round(pval.great,4))
  } else {results <- paste("The p-value equals", alpha, ", the significance level.")}
  results
}

mytest3up() #Use alpha=0.50 to more quickly see other outputs!
mytest3up(0.5)



#-----------------------------------------------------------------------------#
#Examples from notes

ifelse(rnorm(1) > 0,"positive","negative or 0")
ifelse(rnorm(1) > 0,1,0)
ifelse(rnorm(5) > 0,"positive","negative or 0")
ifelse(rnorm(5) > 0,1,0)



if_else(t.test(rnorm(30,100,1),alternative="two.sided",mu=100)$p.value < 0.05, 
        "Results are significant at the 0.05 level.",
        "Results are not significant at the 0.05 level.",
        "Missing p-value.")

pval <- t.test(rnorm(30,100,1),alternative="two.sided",mu=100)$p.value
case_when(pval < 0.05 ~ "Results are significant at the 0.05 level.",
          pval > 0.05 ~ "Results are not significant at the 0.05 level.",
          pval == 0.05 ~ "The p-value equals 0.05, the significance level.",
          .default = "Missing p-value")



pval.vec <- replicate(5,pval <- t.test(rnorm(30,100,1),alternative="two.sided",mu=100)$p.value)
case_when(pval.vec < 0.05 ~ "Results are significant at the 0.05 level.",
          pval.vec > 0.05 ~ "Results are not significant at the 0.05 level.",
          pval.vec == 0.05 ~ "The p-value equals 0.05, the significance level.",
          .default = "Missing p-value")



