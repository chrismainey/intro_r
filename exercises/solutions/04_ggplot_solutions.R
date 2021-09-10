#GGPLOT

#Load ggplot
library(ggplot2)

#Import the capacity_ae dataset which includes information on the differences in
#staff, cubicles and waits between 2017 and 2018
capacity_ae <- read_csv("capacity_ae.csv")

#Is a change in the number of cubicles available in A&E associated with 
#a change in length of attendance?

#syntax = ggplot(data, aes(x,y))
#In ggplot, if we want to use a variable from our data then wrap it in aes()

#Scatter plot with line
ggplot(data = capacity_ae) +
  geom_point(aes(x = dcubicles, y = dwait, colour = staff_increase)) +
  geom_smooth(aes(x = dcubicles, y = dwait),
              method = "lm")

#barplot
tb_cases %>%
  filter(year == "1999") %>%
  ggplot() +
  geom_col(aes(x=country,y=cases)) +
  theme(axis.text.x = element_text(angle = 45))

#faceted bar plot
tb_cases %>%
  ggplot() +
  geom_col(aes(x=country,y=cases,fill = year)) +
  theme(axis.text.x = element_text(angle = 45)) +
  facet_wrap(~year) +
  theme(legend.position = "none")
#add colour but don't need a legend

#line chart
beds_data %>%
  filter(org_name == "Solent") %>%
  ggplot() +
  geom_line(aes(x=date,y=beds_av), colour = "blue") +
  labs(title = "Solent average beds",
       subtitle = "Mental Health",
       x= "Date",
       y="Available Beds") +
  scale_x_date(date_labels = "%b%y",date_breaks = "1 month") +
  theme(axis.text.x = element_text(angle = 45, size = 5)) +
  geom_line(aes(x=date,y=occ_av),colour = "red")

#histogram
beds_data %>%
  ggplot(aes(beds_av)) +
  geom_histogram()

#help and inspiration for charts
#https://www.r-graph-gallery.com/

#boxplot
capacity_ae %>%
  ggplot(aes(staff_increase,dwait)) +
  geom_boxplot() +
  geom_jitter()

#themes
#https://ggplot2.tidyverse.org/reference/ggtheme.html

#plotly
library(plotly)
p <- ggplot(data = capacity_ae) +
  geom_point(aes(x = dcubicles, y = dwait, colour = staff_increase)) +
  geom_smooth(aes(x = dcubicles, y = dwait),
              method = "lm")
ggplotly(p)

#EXERCISE
#Create some plots using the datasets provided and try out the following things
#1. Adding colour
#2. Faceting by a variable
#3. Adding extra geom layers
#4. Changing the theme
