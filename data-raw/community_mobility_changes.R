## code to prepare `community_mobility_changes` dataset goes here

library(tidyverse)
library(tidycovid19)


df<- download_jhu_csse_covid19_data() %>%
  mutate(country = ifelse(country == "US", "USA", country))

community_mobility_changes <- download_google_cmr_data() %>%
  pivot_longer(retail_recreation:residential, names_to = "community_mobility", values_to = "value") %>%
  left_join(df, by= "iso3c") %>%
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

usethis::use_data(community_mobility_changes, overwrite = TRUE)
