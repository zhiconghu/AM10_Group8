library(readr)
library(dplyr)
library(tidyverse)
library(rvest)

caracteristics <- read_csv(here::here("data", "caracteristics.csv"))

# Get INSEE code and department name data
INSEE_code <- read_csv(here::here("data", "departement2021.csv")) %>% 
  select(DEP,NCC) %>% 
  mutate(DEP = as.numeric(DEP))


clean_caracteristics <- caracteristics %>% 
  drop_na(lat, long) %>% 
  # Missing values are stored as 0, so we clean them
  filter(lat != 0 & long != 0) %>% 
  # Data needs to be convert to decimal degrees
  mutate(lat = lat/100000,
         long = long/100000) %>% 
  # Filter locations outside of France
  filter(lat < 51.05 & lat > 42.20) %>% 
  filter(long < 8.13 & long > -4.47) %>% 
  # Insert department level in France
  mutate(dep = round(dep/10)) %>% 
  left_join(INSEE_code, by = c("dep" = "DEP")) %>% 
  drop_na(NCC)
  

ggplot(data = clean_caracteristics, aes(x = long, y = lat)) +
  geom_point()

write.csv(clean_caracteristics, here::here("data","lat_long_data.csv"))