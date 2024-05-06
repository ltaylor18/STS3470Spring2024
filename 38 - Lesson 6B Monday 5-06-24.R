#38 - Lesson 6B
#Monday, 5/6/24


#Example 4A
sum <- 0
for(k in 1:10){
  sum <- sum + k
  print(paste("This is the current value of sum: "))
  print(sum)
}
sum
#Verify:
sum(1:10)

#Example 4B
rm(sum)
#sum <- 0 #The object sum needs to exist before we can use it in a for() loop
for(k in 1:10){
  sum <- sum + k
}
sum


#Example 7
mysequence <- seq(100,2,-2)
for(i in mysequence){print(i/2)}



#Example 5
sum <- 1
for(k in 2:10){
  sum[k] <- sum[k-1]+k
}
sum


#Exercise 1
newsum <- 0
for(i in 1:10){
  newsum <- newsum + i*i
  print(newsum)
}


#Exercise 2 
newsum <- 0
for(i in seq(10,100,10)){
  newsum <- newsum + (i/10)*(i/10)
  print(newsum)
}




#Exercise fill in code:
mymeans3 <- NULL
mymaxes <- NULL
mymeds <- NULL
for(i in 1:1000){
  mysample <- rnorm(30)
  mymeans3[i] <- mean(mysample)
  mymaxes[i] <- max(mysample)
  mymeds[i] <- quantile(mysample,0.5)
}

#Draw your histograms!
library(ggplot2)
ggplot(NULL,aes(x=mymeans3)) + geom_histogram() 
ggplot(NULL,aes(x=mymaxes)) + geom_histogram() 
ggplot(NULL,aes(x=mymeds)) + geom_histogram()


#------------------------------------------------------------------#
#Lesson 6, Activity 1 Solutions

#1
set.seed(2320)

#2
activitymat <- matrix(rnorm(1000*30),nrow=1000)

#3
#Population mean is 0
#Population standard deviation is 1

#4
out <- t.test(activitymat[1,],mu=0,alternative="two.sided")
mypvals <- out$p.value

#5
#> mypvals
#[1] 0.5564892
#The p-value is large, which makes sense. Since the null hypothesis (mu=0)
#is true (we generated Standard Normal values, so mu=0), we would not
#expect to find evidence (in the form of a small p-value) for the alternative

#6
set.seed(2320)
activitymat <- matrix(rnorm(1000*30),nrow=1000)
out <- NULL
mypvals <- NULL
for(i in 1:1000){
  out <- t.test(activitymat[i,],mu=0,alternative="two.sided") #change 1 to i
  mypvals[i] <- out$p.value #Add [i]
}

#6a
#Because we only need to run those lines of code once, not 1000 times

#6b
#1000 rows and 30 columns
#So, 1000 samples of size 30
#Sequence should be 1 to 1000

#6c
#We need to add [i] so that the ith element will contain the p-value. Otherwise,
#mypvals is a scalar and gets replaced each time.

#6d
#Change [1,] to [i,] so that it uses the ith row each time and not the 
#first row each time

#7
sum(mypvals <= 0.05)/1000

sum(mypvals <= 0.10)/1000





#-------------------------------------------------------------------#
#Exercise from Notes 7

#1 - Make a function!
Errors <- function(samples=1000,
                   samplesize=30,
                   munull=0){
  activitymat <- matrix(rnorm(1000*30),nrow=1000)
  out <- NULL
  mypvals <- NULL
  for(i in 1:1000){
    out <- t.test(activitymat[i,],mu=munull,alternative="two.sided") #change 1 to i
    mypvals[i] <- out$p.value #Add [i]
  }

  prop <- sum(mypvals <= 0.05)/1000
  #Uncomment the following if you want to see this statement!
  #print(paste("The proportion of tests yielding p-values less than 0.05 is ",prop,".",sep=""))
  prop
  
}

#2
set.seed(2320)
Errors()
#The proportion is 0.051, it's close to alpha=0.05!

#3
out <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0)
}
out

#> out
#[1] 0.058 0.055 0.052 0.061 0.051
#When we look at different sample sizes, we still get about 5% of our tests
#are in errors for larger and smaller sample sizes!

#4
Errors(samples=5000,samplesize=20,munull=1)

#100% of the tests correctly yield a small p-value (detecting a difference)!
#This is correct because we are testing Ho: mu=1 vs. Ha: mu != 1 and generating
#data from a Standard Normal distribution (so mu=0)
#> Errors(samples=5000,samplesize=20,munull=1)
#[1] 1

#5
#Note: I called this new function Errors2 to distinguish it from before,
#but in the notes I still used the name Errors
Errors2 <- function(samples=1000,
                   samplesize=30,
                   munull=0,
                   mutrue=0){ #Add argument
  activitymat <- matrix(rnorm(1000*30,mean=mutrue),nrow=1000) #Update mean to value from mutrue!
  out <- NULL
  mypvals <- NULL
  for(i in 1:1000){
    out <- t.test(activitymat[i,],mu=munull,alternative="two.sided") #change 1 to i
    mypvals[i] <- out$p.value #Add [i]
  }
  
  prop <- sum(mypvals <= 0.05)/1000
  #Uncomment the following if you want to see this statement!
  #print(paste("The proportion of tests yielding p-values less than 0.05 is ",prop,".",sep=""))
  prop
  
}

Errors2()
set.seed(2320)
Errors2() #Should get 0.051 like before since I used the same seed.

#6
Errors2(samples=5000,samplesize=10,munull=0,mutrue=0.5)

#> Errors2(samples=5000,samplesize=10,munull=0,mutrue=0.5)
#[1] 0.764
#76.4% of samples yielded tests that **correctly* rejected the null 
#in favor of the alternative hypothesis. We want this percent to be
#very high so that our test is yielding the correct conclusion.

#7
out <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors2(samples=5000,samplesize=i,munull=0,mutrue=0.5)
}
out

#Regardless of sample size, the proportion of tests that correctly
#detected the difference is around 70-80%!
#> out
#[1] 0.777 0.755 0.726 0.746 0.745

#8
out <- NULL
differences <- seq(-10,10,1)
for(i in differences){
  out[i+11] <- Errors2(samples=5000,samplesize=20,mutrue=0,munull=i)
}
out

plot(differences,out)

#Wow! Even with samples of size 20, we are able to detect differences between
#the true mean of 0 and means that are different from 0.