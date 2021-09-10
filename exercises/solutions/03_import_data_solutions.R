#IMPORTING DATA

library(readr)

#CSV file 
capacity_ae <- read_csv("capacity_ae.csv")

#More complicated CSV
beds_data <- read_csv("beds_data.csv", col_types = cols(date = col_date(format = "%d/%m/%Y")), 
                      skip = 3)

#date formats
# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

#Excel file
library(readxl)
tb_cases <- read_excel("data/tb_data.xlsx", 
                      sheet = "tb_cases")

tb_pop <- read_excel("data/tb_data.xlsx", 
                      sheet = "tb_pop")