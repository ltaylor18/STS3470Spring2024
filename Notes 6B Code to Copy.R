#Notes 6B - Code to Copy

#Example 1
for(i in 1:5) {print(i)}

#Example 2
for(index in seq(0,10,2)) {print(index)}

#Example 3
for(j in c(1,12,50)){
  print(j)
  print(2*j)
}

#New Example A
mymat <- matrix(1:12,nrow=3)
myrowmeans <- NULL
for(i in 1:nrow(mymat)){
  myrowmeans[i] <- mean(mymat[i,])
}
myrowmeans
#Check
apply(mymat,1,mean)
#What happens if you forget the [i] after myrowmeans?



#Example 4A
sum <- 0
for(k in 1:10){
  sum <- sum + k
}
sum

#Example 4B
rm(sum)
for(k in 1:10){
  sum <- sum + k
}
sum


#Example 5
sum <- 1
for(k in 2:10){
  sum[k] <- sum[k-1] + k
}
sum



#Example 7
mysequence <- seq(100,2,-2)
for(i in mysequence){print(i/2)}





#Exercise fill in code:
mymeans3 <- __________
mymaxes <- NULL
mymeds <- NULL
for(___ in _____){
  mysample <- rnorm(30)
  mymeans3[_______] <- mean(mysample)
  #<<insert line here>>
  #<<insert line here>>
}

#Draw your histograms!





#Notes 7 Exercise Starter Code:
set.seed(2320)
mydata <- rnorm(1000*30)
mydata.mat <- matrix(mydata,nrow=1000,ncol=30)
mypvals <- NULL
for(i in 1:1000){
  out <- t.test(mydata.mat[i,],alternative="two.sided",mu=0)
  mypvals[i] <- out$p.value
}

sum(mypvals <= 0.05)/1000
