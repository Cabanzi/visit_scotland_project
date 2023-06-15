library(tidyverse)
library(janitor)

scottish_accomodation_occupancy <- read_csv(here::here("data/raw_data/scottish_accomodation_occupancy.csv")) %>% 
  clean_names()
