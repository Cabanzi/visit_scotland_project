#Packages
library(tidyverse)
library(janitor)
library(readxl)

#Read in the data
overseas_purpose_spend_per_day_vs_visit <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.05") 

# make the columns easily identifiable  
overseas_purpose_spend_per_day_vs_visit <- overseas_purpose_spend_per_day_vs_visit %>%
  rename_with(~ paste0(substr(., 1, 4), "_spend_per_visit"), `2018...3`:`2022...7`) %>%
  rename_with(~ paste0(substr(., 1, 4), "_spend_per_day"), `2018...8`:`2022...12`)

# Pivot all the years and put the visits/stays into one column 
overseas_purpose_spend_per_day_vs_visit_long <-  overseas_purpose_spend_per_day_vs_visit %>% 
  pivot_longer(names_to = "year",
               cols =   "2018_spend_per_visit":"2022_spend_per_day",
               values_to = "values")

# seperate the number of visits and stays from the value column 
overseas_purpose_spend_per_day_vs_visit_clean <- overseas_purpose_spend_per_day_vs_visit_long %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

# Rename the new columns
overseas_purpose_spend_per_day_vs_visit_clean <- overseas_purpose_spend_per_day_vs_visit_clean %>%
  rename(Avg_spending_per_visit = spend_per_visit,
         Avg_spending_per_day = spend_per_day)

overseas_purpose_spend_per_day_vs_visit_clean <- overseas_purpose_spend_per_day_vs_visit_clean %>% 
  clean_names()

write_csv(overseas_purpose_spend_per_day_vs_visit_clean, 
          here::here("data/clean_data/overseas_purpose_spend_per_day_vs_visit_clean.csv"))