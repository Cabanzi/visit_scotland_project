#packages 
library(tidyverse)
library(readxl)

# Read in the data
overseas_residents_uk_visits <- read_xlsx(here::here("data/raw_data/overseas_residents_uk_visits.xlsx")) %>% 
  clean_names()


# Remove the subsets of Europe, All visits, SA and any other unnecessary columns 
# SA (Seasonal Adjustment)
overseas_residents_uk_visits_trim <- overseas_residents_uk_visits %>% 
  select(-c("all_visit_sa","x5","european_union_nsa", "other_eu_nsa","eu15_nsa"))

# Remove "NSA" from the end of column names in the data frame
#(Non-Seasonal Adjustment)
clean_column_names <- colnames(overseas_residents_uk_visits_trim)
clean_column_names <- gsub("_nsa$", "", clean_column_names)
colnames(overseas_residents_uk_visits_trim) <- clean_column_names

# Pivot data to long form
overseas_residents_uk_visits_clean <- overseas_residents_uk_visits_trim %>% 
  pivot_longer(all_visit:other_countries,
               names_to = "region",
               values_to = "number_of_visits_thousands")




write_csv(overseas_residents_uk_visits_clean, 
          here::here("data/clean_data/overseas_residents_uk_visits_clean.csv"))
