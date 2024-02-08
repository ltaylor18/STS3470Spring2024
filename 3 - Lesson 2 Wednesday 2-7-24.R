#Lesson 2 continued
#Wednesday, 2/7/24

#Announcements: 
#Statistics majors: Senior Comprehensive Evaluation info session 2/14!

?matrix

y <- matrix(1:10,ncol=2)
y

dim(y)

w <- matrix(1:10,nrow=2)
w

w[2,4]

y[,2]

y[2,]

w[1,c(4,5)]

z <- matrix(rep(10,12),3,4)
z

z2 <- matrix(10,3,4)
z2

z3 <- matrix(6:7,4,9)

#k
q <- matrix(10:18,3)
q

#i
y[c(2,3),]
y[2:3,]

y[2:3,1]

##########----------------------------------------


outcomes <- c(0,1)
results10000 <- replicate(10000,sum(sample(outcomes,7,replace=TRUE)))
results10000
is.vector(results10000)

results10 <- replicate(10,sample(outcomes,7,replace=TRUE))
results10

sum(results10[,1])
sum(results10[,2])
sum(results10[,3])

ToothGrowth