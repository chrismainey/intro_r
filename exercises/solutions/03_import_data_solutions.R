#IMPORTING DATA

library(readr)

#CSV files

# Import the 'capacity_ae.csv' dataset from the data folder 
capacity_ae <- read_csv("data/capacity_ae.csv")

# More complicated CSV: import the 'bed_data.csv' from the data folder.
# You can use the wizard and copy it out.
# You'll need to check the date format and where the data start
beds_data <- read_csv("data/beds_data.csv"
                      , col_types = cols(date = col_date(format = "%d/%m/%Y")), 
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
# Now lets read in the 'daily_sitrep.xls' from the data folder.
# Import the sheet called 'Table 1'.


library(readxl)

daily_sitrep <- read_excel("data/daily_sitrep.xlsx", 
                           sheet = "Table 1"
                           , col_types = c("date", "numeric")
                           , skip = 2)
