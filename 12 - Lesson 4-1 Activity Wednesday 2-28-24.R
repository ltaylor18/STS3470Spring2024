#12 - Wednesday 2/28/24
#Lesson 4-1 - Activity 1 SOLUTIONS


#--------------------------------------------------
#Exercise 1

library(ggplot2)
e <- ggplot(mpg, aes(cty, hwy))
e + geom_label(aes(label = cty), 
               nudge_x = 1,
               nudge_y = 1)
e + geom_point()

#1
e + geom_label(aes(label = cty,color=drv), nudge_x = 1, nudge_y = 1)

#2
e + geom_point(aes(color=drv)) #update this code!


vignette("ggplot2-specs")

#3

#3b
e + geom_point(aes(color=drv),shape=21)
#3c
e + geom_point(aes(color=drv),shape=21,stroke=0.5)
#3d
e + geom_point(aes(color=drv),shape=21,stroke=1)
#3e
e + geom_point(aes(color=drv),shape=21,stroke=3)
#3f
#this is what you probably tried:
e + geom_point(aes(color=drv),shape=21,stroke=3,fill="purple")
#this is what I meant to have you do:
e + geom_point(shape=21,stroke=0.5,fill="purple")

#4
e + geom_label(aes(label = cty,color=drv), 
               nudge_x = 1, 
               nudge_y = 1,
               fontface="bold.italic")


#5
e + geom_point(aes(color=drv),alpha=0)
e + geom_point(aes(color=drv),alpha=0.25)
e + geom_point(aes(color=drv),alpha=1)


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
ggplot(Orange,aes(x=age,
                  y=circumference))+
  geom_point(color="orange") +
  geom_line(color="purple")


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
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_boxplot()+
  geom_jitter() +
  scale_color_brewer(palette="BrBG")

#16
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_boxplot()+
  geom_jitter() +
  scale_color_viridis_d(option="E")

#Example using fill and scale_fill_XXX:
ggplot(mpg,aes(x=fl,y=hwy,color=fl))+
  geom_boxplot(aes(fill=fl))+
  geom_jitter() +
  scale_fill_viridis_d(option="E")
