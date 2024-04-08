#26 - Monday, April 8, 2024
#Notes 5-2B

#Exercise
#1

1-pnorm(1.5)
pnorm(1.5,lower.tail=FALSE)

#1b
pnorm(-1.5)
pnorm(1.5,lower.tail=FALSE)
#SAME!
#SYMMETRY!

#2
1-pt(1.5,3)
1-pt(1.5,29)
1-pt(1.5,99)
1-pt(1.5,999)
#2e
1-pnorm(1.5)


#3
1-pt(3,3)
1-pt(3,29)
1-pt(3,99)
1-pt(3,999)
1-pnorm(3)

#3 again
pt(-1,3)
pt(-1,29)
pt(-1,99)
pt(-1,999)
pnorm(-1)

#3
pchisq(10,3)-pchisq(5,3)

#4
qnorm(.975)
qt(.975,9)

#5
pt(qt(.25,9),9)


#Simulation
pnorm(2)-pnorm(1) #probability of being between 1 and 2

mynewnorm <- rnorm(100000,0,1)
sum(mynewnorm >= 1 & mynewnorm <= 2)/100000


#Final Example
1-pnorm(1.96)
sum(mynewnorm >= 1.96)/100000
