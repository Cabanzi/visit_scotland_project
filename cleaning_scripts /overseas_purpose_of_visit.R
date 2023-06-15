#packages 
library(tidyverse)
library(readxl)

# Read in the data
overseas_purpose_of_visit <- read_xlsx(here::here("data/raw_data/overseas_purpose_of_visit.xlsx")) %>% 
  clean_names()
# Remove any other unnecessary columns 
# SA (Seasonal Adjustment)
overseas_purpose_of_visit_trim <- overseas_purpose_of_visit %>% 
  select(-"all_visits_sa")

# Remove "NSA" from the end of column names in the data frame
#(Non-Seasonal Adjustment)
clean_column_names <- colnames(overseas_purpose_of_visit_trim)
clean_column_names <- gsub("_nsa$", "", clean_column_names)
colnames(overseas_purpose_of_visit_trim) <- clean_column_names

# Pivot data to long form
overseas_purpose_of_visit_clean <- overseas_purpose_of_visit_trim %>% 
  pivot_longer(holiday:miscellaneous,
               names_to = "purpose_of_visit",
               values_to = "number_of_visits_thousands")



write_csv(overseas_purpose_of_visit_clean, 
          here::here("data/clean_data/overseas_purpose_of_visit_clean.csv"))