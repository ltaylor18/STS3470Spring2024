#9 - Lesson 4-1 Wednesday, 2/21/24


# Libraries
library(tidyverse)

# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
)

# Plot
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() 


#starwars example
names(starwars)
ggplot(starwars,aes(x=height,y=mass)) + geom_point()

ggplot(starwars,aes(x=height,y=mass)) + geom_point() + 
  ggtitle ("Our first scatterplot")

p <- ggplot(starwars,aes(x=height,y=mass))
p
p + geom_point()
p + geom_point() + ggtitle("Another graph!")

starwars %>% ggplot(aes(x=height,y=mass)) + geom_point()

#Preference between the three syntaxes? 21, 26+28, 31