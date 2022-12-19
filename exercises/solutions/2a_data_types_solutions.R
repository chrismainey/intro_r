# Exercise 2a:  vectors and data.frames

# Create a vector of 5 numbers using the 'c' function

my_vector <- c(3,4,6,2,7)


# Return the 5th number in the vector using it's index in []

my_vector[5]


# Replace the 5th value with a different number

my_vector[5] <- 10





####################
# data.frame
####################

# Run the following, to load a demo dataset into a data frame:

library(NHSRdatasets)

data("LOS_model")


# Inspect the data.frame using: 'View()', and the 'Environment pane in the top right'
# What columns and data types have you got?

View(LOS_model)

# Integers, and 'Ord.factor': ordered factor (categorical data with an order)


# Select just the 'Age' column using '$' notation

LOS_model$Age

# Use the 'max()' function to get the maximum age:

max(LOS_model$Age)

# 95
