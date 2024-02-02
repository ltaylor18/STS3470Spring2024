#Lesson 1 - Activity 1
#You be the ump!
#02/02/2024


#3
Laura
Chris <- 7
Chris
Laura + Chris

#4

outcomes <- c(0,1)
outcomes 


#5
?c

#6
#OUTCOMES
#OutComes
#outcoMES






#7
?sample
#sample(outcomes,7)
#sample(outcomes,7,replace=FALSE)
sample(outcomes,7,replace=TRUE)
sample(outcomes,7,replace=T)
#sample(outcomes,7,replace=true)

#10
sum(sample(outcomes,7,replace=TRUE))


#11
myresults1 <- sum(sample(outcomes,7,replace=TRUE))


#13
?replicate

#replicate(10000,myresults1)
#replicate(myresults1,10000)
replicate(10000,sum(sample(outcomes,7,replace=TRUE)))
#replicate(sum(sample(outcomes,7,replace=TRUE)),10000)

#14
myresults10000 <- replicate(10000,sum(sample(outcomes,7,replace=TRUE)))

#15
myresults10000[1:75] #R starts numbering elements at 1, not 0

#16
table(myresults10000)

#17
68/10000

#18
sum(myresults10000 == 7)/10000

#19
