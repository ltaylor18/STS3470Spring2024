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
