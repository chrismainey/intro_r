# Joining data

library(tidyverse)

# Import the csvs tb_cases, tb_pop and tb_new_table
tb_cases <- read_csv("data/tb_cases.csv")
tb_pop <- read_csv("data/tb_pop.csv")

#LEFT JOIN
#Join tb_cases and tb_pop

#SEMI JOIN
#Finding hospital patients who have had a Covid-19 test but only bring 
#back the information on the hospital, nothing about the test.

#ANTI JOIN
#Join to the tb_new_table and exclude only those records where the column FirstLetter is 'A'.

#In text mining we can anti-join to a dataset of stop words to remove them

