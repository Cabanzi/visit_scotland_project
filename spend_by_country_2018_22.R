# Spending in UK: by country of residence 2018 to 2022
spend_by_country_2018_22 <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.09") 

# Pivot years into long format

spend_by_country_2018_22_clean <- spend_by_country_2018_22 %>% 
  pivot_longer(cols = `2018`:`2022`,
               names_to = "Years",
               values_to = "Spending Million (£)") %>% 
  clean_names() 

write_csv(spend_by_country_2018_22_clean,
          here::here("data/clean_data/spend_by_country_2018_22.csv"))
