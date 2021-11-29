library(readr)
library(dplyr)
library(tidyverse)
library(rvest)

caracteristics <- read_csv(here::here("data", "caracteristics.csv"))

# Get INSEE code and department name data
INSEE_code <- read_csv(here::here("data", "departement2021.csv")) %>% 
  select(DEP,NCC) %>% 
  mutate(DEP = as.numeric(DEP))

# Get population density figures
populationData <- read_csv(here::here("data", "pop_dep_france.csv"), col_names = "data") %>% 
  separate(data, c("DEP", "NCC", "Pop"), ";") %>%
  select(-NCC) %>% 
  mutate(DEP = as.numeric(DEP),
         Pop = gsub(" ", "", Pop),
         Pop = as.numeric(Pop))



clean_caracteristics <- caracteristics %>% 
  #drop_na(lat, long) %>% 
  # Missing values are stored as 0, so we clean them
  #filter(lat != 0 & long != 0) %>% 
  # Data needs to be convert to decimal degrees
  #mutate(lat = lat/100000,
  #       long = long/100000) %>% 
  # Filter locations outside of France
  #filter(lat < 51.05 & lat > 42.20) %>% 
  #filter(long < 8.13 & long > -4.47) %>% 
  # Insert department level in France
  mutate(dep = round(dep/10)) %>% 
  left_join(INSEE_code, by = c("dep" = "DEP")) %>% 
  drop_na(NCC) %>% 
  # Group by departments and summarise
  group_by(NCC, dep) %>% 
  summarise(count = n()) %>%
  # Join population data
  left_join(populationData, by = c("dep" = "DEP")) %>% 
  select(-dep) %>% 
  # Calculate accident per population
  mutate(count_per_million = round((count/Pop)*1000000))
  


write.csv(clean_caracteristics, here::here("data","lat_long_data.csv"))