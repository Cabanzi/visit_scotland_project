#Packages
library(tidyverse)
library(janitor)
library(readxl)

#Read in the data
overseas_purpose_of_visit_by_region <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.04") 

# make the columns easily identifiable  
overseas_purpose_of_visit_by_region <- overseas_purpose_of_visit_by_region %>%
  rename_with(~ paste0(substr(., 1, 4), "_visit"), `2018...3`:`2022...7`) %>%
  rename_with(~ paste0(substr(., 1, 4), "_stay"), `2018...8`:`2022...12`)

# Pivot all the years and put the visits/stays into one column 
overseas_purpose_of_visit_by_region_long <-  overseas_purpose_of_visit_by_region %>% 
  pivot_longer(names_to = "year",
               cols =   "2018_visit":"2022_stay",
               values_to = "values")

# seperate the number of visits and stays from the value column 
overseas_purpose_of_visit_by_region_clean <- overseas_purpose_of_visit_by_region_long %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

# Rename the new columns
overseas_purpose_of_visit_by_region_clean <- overseas_purpose_of_visit_by_region_clean %>%
  rename(number_of_visits = visit,
         avg_length_of_stay = stay)

# Clean column names
overseas_purpose_of_visit_by_region_clean <- overseas_purpose_of_visit_by_region_clean %>% 
  clean_names()

write_csv(overseas_purpose_of_visit_by_region_clean, 
          here::here("data/clean_data/overseas_purpose_of_visit_by_region_clean.csv"))
