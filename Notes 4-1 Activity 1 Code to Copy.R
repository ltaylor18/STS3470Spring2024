#Lesson 4-1 Example Code
#Copy and paste this code so that you don't have to re-type it all!


#--------------------------------------------------
#Exercise 1

library(ggplot2)
e <- ggplot(mpg, aes(cty, hwy))
e + geom_label(aes(label = cty), 
               nudge_x = 1,
               nudge_y = 1)
e + geom_point()

#1
e + geom_label(aes(label = cty), nudge_x = 1, nudge_y = 1)

#2
e + geom_point() #update this code!


vignette("ggplot2-specs")

#3

#4

#5

#6
#a
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_boxplot()+
  geom_jitter()

#b
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_jitter()+
  geom_boxplot()

#c
ggplot(mpg,aes(x=fl,y=hwy))+
  geom_boxplot(aes(color=fl))+
  geom_jitter()

#d
ggplot(mpg,aes(x=fl,y=hwy))+
  geom_boxplot()+
  geom_jitter(aes(color=fl))

#e
ggplot(mpg,aes(x=fl,y=hwy))+
  geom_boxplot(color="green",fill="pink")+
  geom_jitter(aes(color=fl))


##############################################################
#DO NOT run this code until you have first made your matches!#
##############################################################

#10 
#Example 4
ggplot(Orange,aes(x=age,
                  y=circumference,
                  color="green"))+
  geom_point() +
  geom_line()


#Example 5
ggplot(Orange,aes(x=age,
                  y=circumference))+
  geom_point(color="green") +
  geom_line()


#Example 6
ggplot(Orange,aes(x=age,
                  y=circumference))+
  geom_point() +
  geom_line(color="green")




#12



#-------------------------------------------------------
#13
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_boxplot()+
  geom_jitter() +
  scale_color_brewer(palette="Dark2")   

#14
library(RColorBrewer)
display.brewer.all(colorblindFriendly = T)

#15


#16


