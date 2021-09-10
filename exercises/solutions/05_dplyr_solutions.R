#05 dplyr 

#EXAMPLES

#1. arrange the data by org_name (ascending and descending)
beds_data %>%
  arrange(org_name)

beds_data %>%
  arrange(desc(org_name))

#2. filter the data in the following ways
#2.1 org_code equals R1F
beds_data %>%
  filter(org_code == "R1F")

#2.2 beds_av is greater than 50
beds_data %>%
  filter(beds_av > 50)

#2.3 occ)_av is less than or equal to 95
beds_data %>%
  filter(occ_av <= 95)

#2.4 date is not 1st September 2019
beds_data %>%
  filter(date != "2013-09-01")

#2.5 org_name is one of the following: Isle of Wight, Barths Health and Weston Area Health
beds_data %>%
  filter(org_name %in% c("Isle of Wight","Barths Health","Weston Area Health"))

#2.6 beds_av is 6 and org_name is Royal Free London
beds_data %>%
  filter(beds_av == 6 & org_name == "Royal Free London")

#3. mutate the data, create a new column with percentage occupancy
beds_data %>%
  mutate(perc_occ = occ_av / beds_av)

#4. summarise the data to mean number of beds
beds_data %>%
  summarise(mean_beds = mean(beds_av, na.rm=TRUE))

#5. group the data by date and then calculate mean bed days (ungroup at end)
beds_data %>%
  group_by(date) %>%
  summarise(mean_beds = mean(beds_av, na.rm=TRUE)) %>%
  ungroup()

#6. select only the org_code and org_code columns
beds_data %>%
  select(org_name, org_code)

#7. distinct list of dates
beds_data %>%
  distinct(date)

#8. slice min and max: highest and lowest average beds
beds_data %>%
  slice_min(beds_av, n = 1)

beds_data %>%
  slice_max(beds_av, n = 1)

#EXERCISES
#1 Which 2 organisations provided the highest number of MH beds in September 2018?
beds_data %>%
  filter(date == "2018-09-01") %>%
  slice_max(beds_av, n = 2) %>%
  distinct(org_name)

#2 Which 5 organisations had the highest percentage bed occupancy in September 2018?
beds_data %>%
  filter(date == "2018-09-01") %>%
  mutate(perc_occ = occ_av/beds_av) %>%
  slice_max(perc_occ, n = 5) %>%
  distinct(org_name)

#3 Which 5 organisations have the lowest mean % bed occupancy?
beds_data %>%
  group_by(org_name) %>%
  mutate(perc_occ = occ_av/beds_av) %>%
  summarise(mean_perc = mean(perc_occ, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_min(mean_perc, n = 5) %>%
  distinct(org_name)

#4 What are the names of the first 3 organisations when sorted alphabetically?
beds_data %>%
  distinct(org_name) %>%
  arrange(org_name)
