# Joining data

library(tidyverse)

# Import the csvs tb_cases, tb_pop and tb_new_table
tb_cases <- read_csv("data/tb_cases.csv")
tb_pop <- read_csv("data/tb_pop.csv")

#LEFT JOIN
#Join tb_cases and tb_pop
tb_cases %>%
  left_join(tb_pop, by = "country")

tb_cases %>%
  left_join(tb_pop, by = c("year","country"))

tb_cases %>% 
  left_join(tb_new_table, by = c("country" = "Place",
                                 "year" = "Yr"))

#SEMI JOIN
#Finding hospital patients who have had a Covid-19 test but only bring 
#back the information on the hospital, nothing about the test.
tb_cases %>% 
  semi_join(tb_new_table %>% 
              filter(FirstLetter == "A"), by = c("country" = "Place",
                                                 "year" = "Yr"))

#ANTI JOIN
#Join to the tb_new_table and exclude only those records where the column FirstLetter is 'A'.
tb_cases %>% 
  anti_join(tb_new_table %>% 
              filter(FirstLetter == "A"), by = c("country" = "Place",
                                                 "year" = "Yr"))

#In text mining we can anti-join to a dataset of stop words to remove them

