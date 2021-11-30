
library(tidyverse)
library(lubridate)
library(janitor)
library(vroom)
library(skimr)
library(sf)


accidents <- read_csv(here::here("Final Project", "archive", "caracteristics.csv")) %>%
  janitor::clean_names() %>%
  rename(acc_id = num_acc,
         day = jour,
         month = mois,
         year = an,
         time = hrmn,
         light = lum,
         weather = atm,)

holidays <- read_csv(here::here("Final Project", "archive", "holidays.csv")) %>%
  janitor::clean_names() %>%
  rename(date = ds)

location <- read_csv(here::here("Final Project", "archive", "places.csv")) %>%
  janitor::clean_names() %>%
  rename(acc_id = num_acc,
         road_type = catr,
         road_nr = voie,
         traffic_flow = circ,
         lane_nr = nbv,
         bike_lane = vosp,
         road_steep = prof,
         surface = surf,
         road_loc = infra,
         accident_loc = situ,
         near_school = env1)

persons <- read_csv(here::here("Final Project", "archive", "users.csv")) %>%
  janitor::clean_names() %>%
  rename(acc_id = num_acc,
         veh_id = num_veh,
         person_loc = place,
         person_role = catu,
         severity = grav,
         gender = sexe,
         dob = an_nais,
         trip_goal = trajet,
         safety_equip = secu,
         ped_loc = locp,
         ped_action = actp,
         ped_accomp = etatp)

vehicles <- read_csv(here::here("Final Project", "archive", "vehicles.csv")) %>%
  janitor::clean_names() %>%
  rename(acc_id = num_acc,
         veh_id = num_veh,
         vehicle_type = catv)