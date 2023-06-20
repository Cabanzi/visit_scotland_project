#Spending in UK: by mode of travel and purpose of visit 2018 to 2022 

#Read in the data
spending_by_mode_of_travel_and_purpose <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.07") 

# Pivot Year
spending_by_mode_of_travel_and_purpose_long <- spending_by_mode_of_travel_and_purpose %>% 
  pivot_longer(cols = `2018`:`2022`,
               names_to = "Year",
               values_to = "Total Spending (£ million)")

#Remove any unnecessary columns and rearrange 
spending_by_mode_of_travel_and_purpose_clean <- spending_by_mode_of_travel_and_purpose_long %>% 
  select(`Mode of travel`, Purpose, Year,`Total Spending (£ million)`, 
         `Average Annual Growth 2018-22 (%)`) %>% 
  clean_names()

write_csv(spending_by_mode_of_travel_and_purpose_clean,
          here::here("data/clean_data//spending_by_mode_of_travel_and_purpose.csv"))
