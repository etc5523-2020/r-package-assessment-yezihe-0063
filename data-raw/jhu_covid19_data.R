## code to prepare `jhu_covid19_data` dataset goes here

library(tidyverse)
library(lubridate)
library(plotly)
library(tidycovid19)

jhu_covid19_data<- download_jhu_csse_covid19_data() %>%
  mutate(country = ifelse(country == "US", "USA", country))

covid19_cumulative_case <- jhu_covid19_data %>%
  group_by(country) %>%
  mutate(cum_cases = sum(confirmed)) %>%
  select(-timestamp)

covid19_time <- jhu_covid19_data %>%
  mutate(month = month(date),
         day = day(date)) %>%
  select(country,date, month, day, confirmed, deaths, recovered) %>%
  pivot_longer(confirmed:recovered, names_to = "type", values_to = "number")

community_mobility_changes <- download_google_cmr_data() %>%
  pivot_longer(retail_recreation:residential, names_to = "community_mobility", values_to = "value") %>%
  left_join(jhu_covid19_data, by= "iso3c") %>%
  select(country, community_mobility, value) %>%
  group_by(country, community_mobility) %>%
  summarise(mean = mean(value, na.rm = TRUE)) %>%
  mutate(community_mobility = case_when(community_mobility =="grocery_pharmacy" ~ "Grocery & pharmacy",
                                        community_mobility =="parks" ~ "Parks",
                                        community_mobility =="residential" ~ "Residential",
                                        community_mobility =="retail_recreation" ~ "Retail & Recreation",
                                        community_mobility =="transit_stations" ~ "Transit stations",
                                        community_mobility =="workplaces" ~ "Workplaces")) %>%
  arrange(mean)

usethis::use_data(jhu_covid19_data, overwrite = TRUE)
