#Modified from: 
#https://github.com/jennybc/frogs/blob/master/data-raw/frog-cleaning.R
#See the Netflix documentary: "We are the Champions"
#Netflix preview: https://www.youtube.com/watch?v=In78Cr804Ck 

#See also: https://www.youtube.com/watch?v=AjbREbUkspo 

#Chunk #1
library(tidyverse)

#################################################################
#Get the data into RStudio:                                     #
#0. Download the "CalaverasData.xlsx" file from Moodle.         #
#1. Use the "Import Dataset" tool to get your data into RStudio.#
#   Name your data set frogs.
#2. Be sure to copy your code below:                            #
#################################################################

#Chunk #2
frogs <-  rename(frogs,
                 day = Day,
                 frog_type = `rent/ind/pro`,
                 distance = `jump distance`,
                 jump_n = `jump #`,
                 distance_rel = `Relative to jump #1`,
                 distance_3 = `3-jump dist`,
                 distance_3_off = `measured 3-jump`,
                 duration = `jump duration`,
                 angle_00 = unknown1,
                 angle_01 = angle,
                 angle_10 = unknown2,
                 velocity_00 = unknown3,
                 velocity_01 = Vel,
                 velocity_10 = unknown4
) %>%
  mutate(
    row = seq_len(nrow(.))
  ) %>%
  select(row, everything())

#Chunk #3
## dbl --> int
frogs <- frogs %>%
  mutate(jump_n = as.integer(jump_n))

#Chunk #4
## frog_type
frogs <- frogs %>%
  mutate(
    frog_type2 = case_when(
      frog_type == 1 ~ "rental",
      frog_type == 2 ~ "individual",
      frog_type == 3 ~ "pro",
      frog_type < 0 ~ "unknown"
    )
  )
