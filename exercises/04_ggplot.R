#GGPLOT

#Load ggplot
library(ggplot2)

#Import the capacity_ae dataset which includes information on the differences in
#staff, cubicles and waits between 2017 and 2018
capacity_ae <- read_csv("data/capacity_ae.csv")

#Is a change in the number of cubicles available in A&E associated with 
#a change in length of attendance?


#syntax = ggplot(data, aes(x,y))
#In ggplot, if we want to use a variable from our data then wrap it in aes()

#Scatter plot with line

#barplot

#faceted bar plot
#add colour but remove legend

#line chart

#histogram

#help and inspiration for charts
#https://www.r-graph-gallery.com/

#boxplot

#themes
#https://ggplot2.tidyverse.org/reference/ggtheme.html

#plotly

#EXERCISE
#Create some plots using the datasets provided and try out the following things
#1. Adding colour
#2. Faceting by a variable
#3. Adding extra geom layers
#4. Changing the theme
