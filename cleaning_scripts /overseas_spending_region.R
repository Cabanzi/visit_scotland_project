#Packages
library(tidyverse)
library(janitor)
library(readxl)

#Read in the data
overseas_spending_region <- read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.03") 

#Remove unnecessary columns
overseas_spending_region_trim <- overseas_spending_region %>% 
  select(-c(`Change 2021-22 (£ million)`, `Growth 2021-22 (%)`)) 

#Pivot data to get a year column and visit count 
overseas_spending_region_long <- overseas_spending_region_trim %>% 
  pivot_longer(cols = "2018":"2022",
               names_to = "Year",
               values_to = "Spending (£ million)")

# Reorder the data
overseas_spending_region_clean <- overseas_spending_region_long %>%
  select(-`Anuual Growth 2018-22 (%)`, everything(), `Anuual Growth 2018-22 (%)`)

# Clean column names
overseas_spending_region_clean <- overseas_spending_region_clean %>% 
  clean_names()

write_csv(overseas_spending_region_clean, 
          here::here("data/clean_data/overseas_spending_region_clean.csv"))