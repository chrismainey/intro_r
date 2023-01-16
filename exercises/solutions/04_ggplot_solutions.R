#GGPLOT

#Load tidyverse (ggplot2 is part of the tidyverse)
library(tidyverse)

#Import the capacity_ae dataset which includes information on the differences in
#staff, cubicles and waits between 2017 and 2018
capacity_ae <- read_csv("data/capacity_ae.csv")

#Is a change in the number of cubicles available in A&E associated with 
#a change in length of attendance?

#syntax = ggplot(data, aes(x,y))
#In ggplot, if we want to use a variable from our data then wrap it in aes()

#Scatter plot with line
ggplot(data = capacity_ae) +
  geom_point(aes(x = dcubicles, y = dwait, colour = staff_increase)) +
  geom_smooth(aes(x = dcubicles, y = dwait),
              method = "lm")


# Let use the `tb_cases` data set to 
#barplot

tb_cases <- read_csv("data/tb_cases.csv")

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




# Line chart

# load the `beds_data` dataset

beds_data <- read_csv("data/beds_data.csv"
                      , col_types = cols(date = col_date(format = "%d/%m/%Y")), 
                      skip = 3)

# Let's plot the average beds available and occupied, by date data for the organisation "Solent"
beds_data %>%
  filter(org_name == "Solent") %>%
  ggplot() +
  geom_line(aes(x=date,y=beds_av), colour = "blue") +
  geom_line(aes(x=date,y=occ_av),colour = "red") +
  labs(title = "Solent average beds",
       subtitle = "Mental Health",
       x= "Date",
       y="Available Beds") +
  scale_x_date(date_labels = "%b%y",date_breaks = "3 month") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 5))
  



# EXAMPLE of a histogram
beds_data %>%
  ggplot(aes(beds_av)) +
  geom_histogram()

# With more formatting
beds_data %>%
  ggplot(aes(beds_av)) +
  geom_histogram(bins = 15, col="black", fill="dodgerblue2", alpha=0.75)+ 
  labs(title = "Distribution of average bed numbers across trusts",
       x = "Average number of beds",
       y = "Count of trusts")+
  theme_minimal()


#help and inspiration for charts
#https://www.r-graph-gallery.com/




# EXAMPLE: boxplot

capacity_ae <- read_csv("data/capacity_ae.csv")

capacity_ae %>%
  ggplot(aes(staff_increase,dwait)) +
  geom_boxplot() 


capacity_ae %>%
  ggplot(aes(staff_increase,dwait)) +
  geom_boxplot(col="black", fill="dodgerblue2", alpha=0.75) +
  geom_jitter(fill="orange", shape = 21) + # this is a scatter plot on top, but 'jitters' to points to the sides so they don't overlay
  labs(title = "Distribution of waits by staff increase",
       subtitle = "TRUE = staff increase",
       x = "Staff increase",
       y = "Wait") +
  theme_minimal()


# Reference for themes
#themes
#https://ggplot2.tidyverse.org/reference/ggtheme.html



# Extra:  convert ggplot2 to plotly
library(plotly)
p <- ggplot(data = capacity_ae) +
  geom_point(aes(x = dcubicles, y = dwait, colour = staff_increase)) +
  geom_smooth(aes(x = dcubicles, y = dwait),
              method = "lm")
ggplotly(p)


