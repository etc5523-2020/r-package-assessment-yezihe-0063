## code to prepare `jhu_covid19_data` dataset goes here
library(tidyverse)
library(tidycovid19)

jhu_covid19_data <- download_jhu_csse_covid19_data(cached = TRUE) %>%
  mutate(country = ifelse(country == "US", "USA", country) )%>%
  group_by(country) %>%
  mutate(cum_cases = sum(confirmed)) %>%
  select(-timestamp)

usethis::use_data(jhu_covid19_data, overwrite = TRUE)
