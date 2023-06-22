library(tidyverse)
library(readxl)
library(janitor)
# Number of visits to specified UK regions: by region of residence and quarter 2018 to 2022

#Read in the data
visits_to_uk_regions_by_qtr_2018_22 <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.16") 

#Pivot the Years/ Qtrs and clean names
visits_to_uk_regions_by_qtr_2018_22_long <- visits_to_uk_regions_by_qtr_2018_22 %>% 
  pivot_longer(cols = `2018 Qtr 1`:`2022 Qtr 4`,
               names_to = "Year",
               values_to = "Number_of_Visits_Thousands") %>% 
  clean_names()

write_csv(visits_to_uk_regions_by_qtr_2018_22_long,
          here::here("data/clean_data/visits_to_uk_regions_by_qtr_2018_22.csv"))
