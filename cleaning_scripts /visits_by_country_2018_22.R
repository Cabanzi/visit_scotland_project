# Number of visits to UK: by country of residence and nationality 2018 to 2022

#Read in the data
visits_by_country_2018_22 <- 
  read_excel("../visit_scotland_project/data/raw_data/overseas_trends.xlsx","2.17") 

# Make data sets for each year 
#2018
visits_by_country_2018 <- visits_by_country_2018_22 %>% 
  select(Region:`2018_Total`) %>% 
  pivot_longer(cols = `2018_Country of residence`:`2018_Total`,
               names_to = "year",
               values_to = "values") %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

#2019
visits_by_country_2019 <- visits_by_country_2018_22 %>% 
  select(Region, `2019_Country of residence`:`2019_Total`) %>% 
  pivot_longer(cols = `2019_Country of residence`:`2019_Total`,
               names_to = "year",
               values_to = "values") %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

#2020
visits_by_country_2020 <- visits_by_country_2018_22 %>% 
  select(Region, `2020_Country of residence`:`2020_Total`) %>% 
  pivot_longer(cols = `2020_Country of residence`:`2020_Total`,
               names_to = "year",
               values_to = "values") %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

#2021
visits_by_country_2021 <- visits_by_country_2018_22 %>% 
  select(Region, `2021_Country of residence`:`2021_Total`) %>% 
  pivot_longer(cols = `2021_Country of residence`:`2021_Total`,
               names_to = "year",
               values_to = "values") %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

#2022
visits_by_country_2022 <- visits_by_country_2018_22 %>% 
  select(Region, `2022_Country of residence`:`2022_Total`) %>% 
  pivot_longer(cols = `2022_Country of residence`:`2022_Total`,
               names_to = "year",
               values_to = "values") %>%
  separate(col = year,
           into = c("Year", "Type"),
           sep = "_",
           extra = "merge") %>%
  pivot_wider(names_from = Type,
              values_from = values)

# Bind the data sets together by the "year" column
visits_by_country_2018_22_clean <- bind_rows(visits_by_country_2018, visits_by_country_2019, visits_by_country_2020, visits_by_country_2021, visits_by_country_2022)

write_csv(visits_by_country_2018_22_clean,
          here::here("data/clean_data/visits_by_country_2018_22"))