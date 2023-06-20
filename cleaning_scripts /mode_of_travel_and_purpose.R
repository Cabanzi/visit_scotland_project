# Number of visits to UK: by mode of travel and purpose of visit 2018 to 2022

#Packages
library(tidyverse)
library(janitor)
library(readxl)

#Read in the data
mode_of_travel_and_purpose <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.06") 

# Pivot Year
mode_of_travel_and_purpose_long <- mode_of_travel_and_purpose %>% 
  pivot_longer(cols = `2018`:`2022`,
               names_to = "Year",
               values_to = "Number of Visits")

#Remove any unnecessary columns and rearrange 
mode_of_travel_and_purpose_clean <- mode_of_travel_and_purpose_long %>% 
  select(`Mode of Travel`, Purpose, Year, `Number of Visits`,
         `Average Annual Growth 2018-22(%)`) %>% 
  clean_names()

write_csv(mode_of_travel_and_purpose_clean,
          here::here("data/clean_data//mode_of_travel_and_purpose.csv"))
