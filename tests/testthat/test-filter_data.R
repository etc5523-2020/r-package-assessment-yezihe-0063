test_that("filter_data()", {
  expect_equal(filter_data(covid19_time, "Australia", c("confirmed","deaths")),
               covid19_time %>%
                dplyr::filter(country == "Australia",
                        type %in% c("confirmed","deaths")))

  expect_error(filter_data(covid19_time, "Australia"))
  expect_error(filter_data(covid19_time, c("confirmed","deaths")))
})
