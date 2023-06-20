# Number of visits to and spending in UK regions: by region of residence 2018 to 2022

#Read in the data
visits_to_and_spending_in_uk_regions <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.14") 

# make the columns easily identifiable  
visits_to_and_spending_in_uk_regions <- 
  visits_to_and_spending_in_uk_regions %>%
  rename_with(~ paste0(substr(., 1, 4), "_visits"), `2018...3`:`2022...7`) %>%
  rename_with(~ paste0(substr(., 1, 4), "_spending"), `2018...8`:`2022...12`)

# Pivot all the years and put the visits/stays into one column 
visits_to_and_spending_in_uk_regions_long <- 
  visits_to_and_spending_in_uk_regions %>% 
  pivot_longer(names_to = "year",
               cols =   "2018_visits":"2022_spending",
               values_to = "values")

# separate the number of visits and stays from the value column 
visits_to_and_spending_in_uk_regions_clean <- 
  visits_to_and_spending_in_uk_regions_long %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

# Rename the new columns and clean names
visits_to_and_spending_in_uk_regions_clean  <- 
  visits_to_and_spending_in_uk_regions_clean  %>%
  rename(number_of_visits_thousands = visits,
         spending_million = spending) %>% 
  clean_names()

write_csv(visits_to_and_spending_in_uk_regions_clean, 
          here::here("data/clean_data/visits_to_and_spending_in_uk_regions.csv"))