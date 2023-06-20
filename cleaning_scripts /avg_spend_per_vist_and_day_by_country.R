# Average spend per visit to UK and per day: by country of residence 2018 to 2022

#Read in the data
avg_spend_per_vist_and_day_by_country <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.11") 

# make the columns easily identifiable  
avg_spend_per_vist_and_day_by_country <- 
  avg_spend_per_vist_and_day_by_country  %>%
  rename_with(~ paste0(substr(., 1, 4), "_spend_per_visit"), `2018...2`:`2022...6`) %>%
  rename_with(~ paste0(substr(., 1, 4), "_spend_per_day"), `2018...7`:`2022...11`)

# Pivot all the years and put the visits/stays into one column 
avg_spend_per_vist_and_day_by_country_long <- 
  avg_spend_per_vist_and_day_by_country %>% 
  pivot_longer(names_to = "year",
               cols =  "2018_spend_per_visit":"2022_spend_per_day",
               values_to = "values")

# separate the number of visits and stays from the value column 
avg_spend_per_vist_and_day_by_country_clean <- 
  avg_spend_per_vist_and_day_by_country_long %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)  %>% 
  clean_names()


write_csv(avg_spend_per_vist_and_day_by_country_clean, 
          here::here("data/clean_data/avg_spend_per_vist_and_day_by_country.csv"))