#37 - Lesson 6A and 6B
#Friday, 5/3/24


#-----------------------------------------------------------------------------#
#Example 5

x <- c(-1:1,NA)
case_when(x > 0 ~ paste(x,
                        " is a positive number.",
                        sep=""),
          x < 0 ~ paste(x,
                        " is a negative number. The absolute value is ",
                        abs(x),
                        sep=""),
          x == 0 ~ paste("The value is 0!"),
          .default = paste("Missing value!")
)

#What if?
case_when(x > 0 ~ paste(x,
                        " is a positive number.",
                        sep=""),
          x <= 0 ~ paste(x,
                         " is a negative number. The absolute value is ",
                         abs(x),
                         sep=""),
          x == 0 ~ paste("The value is 0!"),
          .default = paste("Missing value!")
)



#-----------------------------------------------------------------------------#
#Example 6

#set.seed(2320)
w <- rnorm(30)
t <- (mean(w)-0)/(sd(w)/sqrt(30))


# if()
if(t >= 0){1-pt(t,29)
} else {pt(t,29)}


# if_else()
if_else(t >=0, 
        1-pt(t,29), 
        pt(t,29))

#-----------------------------------------------------------------------------#
#Example 7


# else_if
if(t > 0) {
  1-pt(t,29)
} else if(t < 0){
  pt(t,29)
} else {
  1
}


# case_when
case_when(t > 0 ~ 1-pt(t,29),
          t < 0 ~ pt(t,29),
          t == 0 ~ 1) #or TRUE ~ 1 or .default = 1




#-----------------------------------------------------------------------------#
#Example 8

#From Notes 5-2A:
mydata <- replicate(10000,rnorm(9,100,5))
samp.means <- apply(mydata,2,mean)
samp.sd <- apply(mydata,2,sd)
zscores <- (samp.means - 100)/(5/sqrt(9))
tscores <- (samp.means - 100)/(samp.sd/sqrt(9))

mydata.df <- data.frame(samp.means=samp.means,
                        samp.sd=samp.sd,
                        zscores=zscores,
                        tscores=tscores)
mydata.df <- mutate(mydata.df,mystery=tscores*tscores)
mydata.df <- mutate(mydata.df, newy=case_when(
  df(mystery,1,9) >= 0.5 ~ NA,
  .default = df(mystery,1,9)
))

ggplot(mydata.df,aes(x=mystery))+
  geom_histogram(aes(y=after_stat(density)),color="white",bins=30)+
  geom_line(aes(y=newy))




####################################################
##################### Notes 6B #####################
####################################################

#Notes 6B exploration

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
mymat
myrowmeans <- NULL
for(i in 1:nrow(mymat)){
  myrowmeans[i] <- mean(mymat[i,])
}
myrowmeans
#Check
apply(mymat,1,mean)


#What happens if you forget the [i] after myrowmeans?
mymat <- matrix(1:12,nrow=3)
mymat
myrowmeans <- NULL
for(i in 1:nrow(mymat)){
  myrowmeans <- mean(mymat[i,])
}
myrowmeans

#New Example A - Calculate the mean of each column
mymat <- matrix(1:12,nrow=3)
mymat
myrowmeans <- NULL
for(i in 1:ncol(mymat)){
  myrowmeans[i] <- mean(mymat[,i])
}
myrowmeans

