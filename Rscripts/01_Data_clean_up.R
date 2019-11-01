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

#looking at structure of the data

str(field.df)

## Checking for issues in inconsistencies in naming
unique(field.df$Site) # no errors in site name
unique(field.df$Suborder) # looks good
unique(field.df$Family) # looks good
unique(field.df$Genus) # need to fix Ischnura - fixed in excel on 10/31


# Check for outliers

hist( field.df$Body.Length) # looks ok

hist( field.df$Head.Width) # looks ok

hist( field.df$Wing.Pad) # looks ok

plot( x =field.df$Body.Length, y=  field.df$Head.Width)

pairs( field.df[,7:9])


## exploring patterns across families using ggplot


ggplot( field.df, aes( x=Body.Length, y = Head.Width,  color = Family) ) +
  geom_point(size=3, alpha = .5) + theme_classic()+
  scale_color_brewer(palette = "Set2") + facet_wrap(~Site)


ggplot(field.df, aes(Head.Width, color = Family,fill = Family)) +
  geom_density(adjust =2, alpha=.5,
               position = "stack") +facet_wrap(~Site, scales = "free_y")
 

library(ggridges)
