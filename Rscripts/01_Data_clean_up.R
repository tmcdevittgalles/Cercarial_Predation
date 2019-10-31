## The goal of this code is to explore the variation and size in cercarial
## predators in ponds in the East Bay Area
## 
## Creation date : 10/31/2010
## 

## load in necessary libraries
library(tidyverse)
library(lme4)


# Set working directory
setwd( "~/Desktop/Current_Projects/Cercarial_Predation" )


# load in data
field.df <- read.csv("./Data/Raw_Data/Cercarial_Predators.csv")


str(field.df)

test 1