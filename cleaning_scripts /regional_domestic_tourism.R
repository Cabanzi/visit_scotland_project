library(tidyverse)
library(janitor)
regional_domestic_tourism <- read_csv(here::here("data/raw_data/regional_domestic_tourism.csv")) %>% 
  clean_names()

glimpse(regional_domestic_tourism)

regional_domestic_tourism %>% 
  distinct(region_of_residence)
