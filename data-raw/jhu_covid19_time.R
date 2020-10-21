## code to prepare `jhu_covid19_time` dataset goes here
library(tidyverse)
library(lubridate)
library(tidycovid19)

jhu_covid19_time <- download_jhu_csse_covid19_data(cached = TRUE) %>%
  mutate(country = ifelse(country == "US", "USA", country)) %>%
  mutate(month = month(date),
         day = day(date)) %>%
  select(country,date, month, day, confirmed, deaths, recovered) %>%
  pivot_longer(confirmed:recovered, names_to = "type", values_to = "number")

usethis::use_data(jhu_covid19_time, overwrite = TRUE)
